using System;
using System.Collections.Generic;
using System.Text;

namespace backgammon
{
    class AiNegamax
    {
        class Step
        {
            public int score = 0;
            public int step = 0;
            public int abcut = 0;
            public List<AiBoard.Point> steps = new List<AiBoard.Point>();

        }
        private AiBoard board;
        private static int MAX = (int)AiConfig.score.five * 10;
        private static int MIN = -1 * MAX;
        private int count = 0;
        private int PVcut;
        private int ABcut;
        private int cacheCount = 0;
        private int cacheGet = 0;

        private long start;

        private List<int> Cache = new List<int>();

        public void init(AiBoard _board)
        {
            board = _board;
        }

        public List<AiBoard.Point> deepAll(int deep, int role = (int)AiConfig.player.com)
        {
            var candidates = new List<AiBoard.Point>();
            board.gen(role).ForEach(i => candidates.Add(i));
            var result = new List<AiBoard.Point>();
            deeping(candidates, role, deep).ForEach(i => result.Add(i));
            return result;
        }

        private List<AiBoard.Point> deeping(List<AiBoard.Point> candidates, int role, int deep)
        {
            var startTime = TimeZoneInfo.ConvertTime(new System.DateTime(1970, 1, 1), TimeZoneInfo.Local);
            var timeStamp = (long)(DateTime.Now - startTime).TotalMilliseconds;
            Cache.Clear(); // 每次开始迭代的时候清空缓存。这里缓存的主要目的是在每一次的时候加快搜索，而不是长期存储。事实证明这样的清空方式对搜索速度的影响非常小（小于10%)

            int bestScore;
            for (int i = 2; i <= deep; i += 2)
            {
                bestScore = negamax(candidates, role, i, MIN, MAX);

                //// 每次迭代剔除必败点，直到没有必败点或者只剩最后一个点
                //// 实际上，由于必败点几乎都会被AB剪枝剪掉，因此这段代码几乎不会生效
                //var newCandidates = candidates.filter(function (d) {
                //  return !d.abcut
                //})
                //candidates = newCandidates.length ? newCandidates : [candidates[0]] // 必败了，随便走走

                if (AiMath.greatOrEqualThan(bestScore, (int)AiConfig.score.five)) break;
            }

            // 美化一下
            // candidates = candidates.map(function (d) {
            //   var r = [d[0], d[1]]
            //   r.score = d.v.score
            //   r.step = d.v.step
            //   r.steps = d.v.steps
            //   if (d.v.vct) r.vct = d.v.vct
            //   if (d.v.vcf) r.vcf = d.v.vcf
            //   return r
            // 

            // 排序
            // 经过测试，这个如果放在上面的for循环中（就是每次迭代都排序），反而由于迭代深度太浅，排序不好反而会降低搜索速度。
            candidates.Sort((a, b) =>
            {
                if (AiMath.equal(a.score, b.score))
                {
                    // 大于零是优势，尽快获胜，因此取步数短的
                    // 小于0是劣势，尽量拖延，因此取步数长的
                    // if (a.score >= 0) {
                    //   if (a.step !== b.step) return a.step - b.step
                    //   else return b.score - a.score // 否则 选取当前分最高的（直接评分)
                    // }
                    // else {
                    //   if (a.step !== b.step) return b.step - a.step
                    //   else return b.score - a.score // 否则 选取当前分最高的（直接评分)
                    // }
                    return b.score - a.score;
                }else{
                    return b.score - a.score;
                }
            });
            var result = candidates;
            return result;
        }

        private int negamax(List<AiBoard.Point> candidates, int role, int deep, int alpha, int beta)
        {
            count = 0;
            ABcut = 0;
            PVcut = 0;
            board.currentSteps.Clear();

            for (int i = 0; i < candidates.Count; i++)
            {
                var p = candidates[i];
                board.put(p, role);
                var steps = new List<AiBoard.Point> { p };
                var v = r(deep - 1, -beta, -alpha, role == (int)AiConfig.player.com ? (int)AiConfig.player.hum : (int)AiConfig.player.com, 1, steps, 0);
                v.score *= -1;
                alpha = Math.Max(alpha, v.score);
                board.remove(p);
                // p.v = v;

                if ((long)(DateTime.Now - TimeZoneInfo.ConvertTime(new System.DateTime(1970, 1, 1), TimeZoneInfo.Local)).TotalMilliseconds - start > AiConfig.timeLimit * 1000)
                {
                    break;
                }
            }

            return alpha;
        }

        private Step r(int deep, int alpha, int beta, int role, int step, List<AiBoard.Point> steps, int spread)
        {
            // if(config.cache) {
            //   var c = Cache[board.zobrist.code]
            //   if(c) {
            //     if(c.deep >= deep) { // 如果缓存中的结果搜索深度不比当前小，则结果完全可用
            //       cacheGet ++
            //       // 记得clone，因为这个分数会在搜索过程中被修改，会使缓存中的值不正确
            //       return {
            //         score: c.score.score,
            //         steps: steps,
            //         step: step + c.score.step,
            //         c: c
            //       }
            //     } else {
            //       // 如果缓存的结果中搜索深度比当前小，那么任何一方出现双三及以上结果的情况下可用
            //       // TODO: 只有这一个缓存策略是会导致开启缓存后会和以前的结果有一点点区别的，其他几种都是透明的缓存策略
            //       if (math.greatOrEqualThan(c.score, SCORE.FOUR) || math.littleOrEqualThan(c.score, -SCORE.FOUR)) {
            //         cacheGet ++
            //         return c.score
            //       }
            //     }
            //   }
            // }

            var _e = board.evaluate(role);

            var leaf = new Step();
            leaf.score = _e;
            leaf.step = step;
            leaf.steps = steps;

            count++;
            // 搜索到底 或者已经胜利
            // 注意这里是小于0，而不是1，因为本次直接返回结果并没有下一步棋
            if (deep <= 0 || AiMath.greatOrEqualThan(_e, (int)AiConfig.score.five) || AiMath.littleOrEqualThan(_e, -(int)AiConfig.score.five))
            {
                //// 经过测试，把算杀放在对子节点的搜索之后，比放在前面速度更快一些。
                //// vcf
                //// 自己没有形成活四，对面也没有形成活四，那么先尝试VCF
                //if(math.littleThan(_e, SCORE.FOUR) && math.greatThan(_e, SCORE.FOUR * -1)) {
                //  mate = vcx.vcf(role, vcxDeep)
                //  if(mate) {
                //    config.debug && console.log('vcf success')
                //    v = {
                //      score: mate.score,
                //      step: step + mate.length,
                //      steps: steps,
                //      vcf: mate // 一个标记为，表示这个值是由vcx算出的
                //    }
                //    return v
                //  }
                //} // vct
                //// 自己没有形成活三，对面也没有高于活三的棋型，那么尝试VCT
                //if(math.littleThan(_e, SCORE.THREE*2) && math.greatThan(_e, SCORE.THREE * -2)) {
                //  var mate = vcx.vct(role, vcxDeep)
                //  if(mate) {
                //    config.debug && console.log('vct success')
                //    v = {
                //      score: mate.score,
                //      step: step + mate.length,
                //      steps: steps,
                //      vct: mate // 一个标记为，表示这个值是由vcx算出的
                //    }
                //  return v
                //  }
                //}
                return leaf;
            }

            var best = new Step();
            best.score = MIN;
            best.step = step;
            best.steps = steps;

            // 双方个下两个子之后，开启star spread 模式
            var points = board.gen(role, board.count > 10 ? step > 1 : step > 3, step > 1);

            if (points.Count != 0)
            {
                return leaf;
            }

            for (int i = 0; i < points.Count; i++)
            {
                var p = points[i];
                board.put(p, role);

                var _deep = deep - 1;
                var _spread = spread;
                if (_spread < AiConfig.countLimit)
                {
                    // 冲四延伸
                    if ((role == (int)AiConfig.player.com && p.scoreHum >= (int)AiConfig.score.five) || (role == (int)AiConfig.player.hum && p.scoreCom >= (int)AiConfig.score.five))
                    {
                        _deep += 2;
                        _spread++;
                    }
                    // 单步延伸策略：双三延伸
                    //if ( (role == R.com && p.scoreCom >= SCORE.THREE * 2) || (role == R.hum && p.scoreHum >= SCORE.THREE*2)) {
                    //  _deep = deep
                    //  _spread ++
                    //}
                }

                var _steps = steps;
                _steps.Add(p);
                var v = r(_deep, -beta, -alpha, role == (int)AiConfig.player.com ? (int)AiConfig.player.hum : (int)AiConfig.player.com, step + 1, _steps, _spread);
                v.score *= -1;
                board.remove(p);

                // 注意，这里决定了剪枝时使用的值必须比MAX小
                if (v.score > best.score)
                {
                    best = v;
                }
                alpha = Math.Max(best.score, alpha);
                //AB 剪枝
                // 这里不要直接返回原来的值，因为这样上一层会以为就是这个分，实际上这个节点直接剪掉就好了，根本不用考虑，也就是直接给一个很大的值让他被减掉
                // 这样会导致一些差不多的节点都被剪掉，但是没关系，不影响棋力
                // 一定要注意，这里必须是 greatThan 即 明显大于，而不是 greatOrEqualThan 不然会出现很多差不多的有用分支被剪掉，会出现致命错误
                if (AiMath.greatOrEqualThan(v.score, beta))
                {
                    ABcut++;
                    v.score = MAX - 1; // 被剪枝的，直接用一个极大值来记录，但是注意必须比MAX小
                    v.abcut = 1; // 剪枝标记
                    // cache(deep, v) // 别缓存被剪枝的，而且，这个返回到上层之后，也注意都不要缓存
                    return v;
                }
            }

            cache(deep, best);

            return best;
        }

        private bool cache(int deep, Step score)
        {
            if (!AiConfig.cache) return false;
            return false;
        }
    }
}
