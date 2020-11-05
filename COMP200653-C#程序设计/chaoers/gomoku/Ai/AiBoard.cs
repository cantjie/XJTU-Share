using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;

namespace backgammon
{
    class AiBoard
    {
        class AiStatistic
        {
            public int[,] table;
            public void init(int size)
            {
                table = new int[size, size];
            }
        }

        public class Point
        {
            public Point(int x, int y)
            {
                p = new int[] { x, y };
            }
            public int[] p;
            public int scoreHum = 0;
            public int scoreCom = 0;
            public int score = 0;
            public int role = 0;
        }
        // class Zobrist
        // {
        //     private int[,] com = new int[15,15];
        //     private int[,] hum = new int[15,15];
        //     public void init()
        //     {
        //         com = new int[15,15];
        //         hum = new int[15,15];
        //     }
        // }

        // private AiStatistic statistic = new AiStatistic();
        public int[,] board = new int[15, 15];
        public List<Point> currentSteps = new List<Point>();
        public List<Point> allSteps = new List<Point>();
        public List<Point> stepsTail = new List<Point>();
        public int count = 0;
        private int total = 0;

        // scoreCache[role][dir][row,column]
        private int[][][,] scoreCache = new int[3][][,] { new int[4][,] { new int[15, 15], new int[15, 15], new int[15, 15], new int[15, 15] }, new int[4][,] { new int[15, 15], new int[15, 15], new int[15, 15], new int[15, 15] }, new int[4][,] { new int[15, 15], new int[15, 15], new int[15, 15], new int[15, 15] } };

        // 储存双方得分
        private int[,] comScore = new int[15, 15];
        private int[,] humScore = new int[15, 15];

        // 传入棋子矩阵和位数
        public void init(int size)
        {
            // statistic.init(size);
            initScore();
        }

        public void put(Point p, int role)
        {
            p.role = role;
            board[p.p[0], p.p[1]] = role;
            updateScore(p);
            allSteps.Add(p);
            currentSteps.Add(p);
            stepsTail.Clear();
            count++;
        }

        public void remove(Point p)
        {
            var r = board[p.p[0], p.p[1]];
            // this.zobrist.go(p[0], p[1], r)
            board[p.p[0], p.p[1]] = (int)AiConfig.player.empty;

            updateScore(p);
            allSteps.RemoveAt(allSteps.Count - 1);
            currentSteps.RemoveAt(currentSteps.Count - 1);
            count--;
        }

        private void updateScore(Point p)
        {
            var radius = 4;
            void update(int x, int y, int dir)
            {
                var role = board[x, y];
                if (role != (int)AiConfig.player.hum)
                {
                    var cs = scorePoint(x, y, (int)AiConfig.player.com, dir);
                    comScore[x, y] = cs;
                    // statistic.table[x, y] += cs;
                }
                else
                {
                    comScore[x, y] = 0;
                }
                if (role != (int)AiConfig.player.com)
                {
                    var hs = scorePoint(x, y, (int)AiConfig.player.hum, dir);
                    humScore[x, y] = hs;
                    // statistic.table[x, y] += hs;
                }
                else
                {
                    humScore[x, y] = 0;
                }
            }

            // 无论是不是空位 都需要更新
            // -
            for (int i = -radius; i <= radius; i++)
            {
                var x = p.p[0];
                var y = p.p[1] + i;
                if (y < 0) continue;
                if (y >= 15) break;
                update(x, y, 0);
            }

            // |
            for (int i = -radius; i <= radius; i++)
            {
                var x = p.p[0] + i;
                var y = p.p[1];
                if (x < 0) continue;
                if (x >= 15) break;
                update(x, y, 1);
            }

            // \
            for (int i = -radius; i <= radius; i++)
            {
                var x = p.p[0] + i;
                var y = p.p[1] + i;
                if (x < 0 || y < 0) continue;
                if (x >= 15 || y >= 15) break;
                update(x, y, 2);
            }

            // /
            for (int i = -radius; i <= radius; i++)
            {
                var x = p.p[0] + i;
                var y = p.p[1] - i;
                if (x < 0 || y < 0) continue;
                if (x >= 15 || y >= 15) break;
                update(x, y, 3);
            }
        }

        private void initScore()
        {
            for (int i = 0; i < 15; i++)
            {
                for (int j = 0; j < 15; j++)
                {
                    if (board[i, j] == (int)AiConfig.player.empty)
                    {
                        if (hasNeighbor(i, j, 2, 2)) //必须是有邻居的才行
                        {
                            var cs = scorePoint(i, j, (int)AiConfig.player.com, -1);
                            var hs = scorePoint(i, j, (int)AiConfig.player.hum, -1);
                            comScore[i, j] = cs;
                            humScore[i, j] = hs;
                        }
                    }
                    else if (board[i, j] == (int)AiConfig.player.com) // 对电脑打分，玩家此位置分数为0
                    {
                        comScore[i, j] = scorePoint(i, j, (int)AiConfig.player.com, -1);
                        humScore[i, j] = 0;
                    }
                    else if (board[i, j] == (int)AiConfig.player.hum) // 对玩家打分，电脑位置分数为0
                    {
                        humScore[i, j] = scorePoint(i, j, (int)AiConfig.player.hum, -1);
                        comScore[i, j] = 0;
                    }
                }
            }
        }

        private bool hasNeighbor(int x, int y, int distance, int count)
        {
            var startX = x - distance;
            var endX = x + distance;
            var startY = y - distance;
            var endY = y + distance;
            for (int i = startX; i <= endX; i++)
            {
                if (i < 0 || i >= 15) continue;
                for (int j = startY; j <= endY; j++)
                {
                    if (j < 0 || j >= 15) continue;
                    if (i == x && j == y) continue;
                    if (board[i, j] != (int)AiConfig.player.empty)
                    {
                        count--;
                        if (count <= 0)
                        {
                            return true;
                        }
                    }
                }
            }
            return false;
        }

        /*
        * 启发式评价函数
        * 这个是专门给某一个位置打分的，不是给整个棋盘打分的
        * 并且是只给某一个角色打分
        */
        private int scorePoint(int px, int py, int role, int dir)
        /*
        * 表示在当前位置下一个棋子后的分数
        * 为了性能考虑，增加了一个dir参数，如果没有传入则默认计算所有四个方向，如果传入值，则只计算其中一个方向的值
        */
        {
            var result = 0;
            // var radius = 8;
            var empty = 0;
            var count = 0;
            var block = 0;
            var secondCount = 0;

            void reset()
            {
                count = 1;
                block = 0;
                empty = -1;
                secondCount = 0;
            }

            if (dir == 0 || dir == -1)
            {
                reset();
                for (int i = py + 1; true; i++)
                {
                    if (i >= 15)
                    {
                        block++;
                        break;
                    }
                    var t = board[px, i];
                    if (t == (int)AiConfig.player.empty)
                    {
                        if (empty == -1 && i < 15 - 1 && board[px, i + 1] == role)
                        {
                            empty = count;
                            continue;
                        }
                        else
                        {
                            break;
                        }
                    }
                    if (t == role)
                    {
                        count++;
                        continue;
                    }
                    else
                    {
                        block++;
                        break;
                    }
                }

                for (int i = py - 1; true; i--)
                {
                    if (i < 0)
                    {
                        block++;
                        break;
                    }
                    var t = board[px, i];
                    if (t == (int)AiConfig.player.empty)
                    {
                        if (empty == -1 && i > 0 && board[px, i - 1] == role)
                        {
                            empty = 0;  //注意这里是0，因为是从右往左走的
                            continue;
                        }
                        else
                        {
                            break;
                        }
                    }
                    if (t == role)
                    {
                        secondCount++;
                        if (empty != -1) empty++;
                        continue;
                    }
                    else
                    {
                        block++;
                        break;
                    }
                }

                count += secondCount;

                scoreCache[role][0][px, py] = countToScore(count, block, empty);
            }
            result += scoreCache[role][0][px, py];

            if (dir == 1 || dir == -1)
            {
                reset();
                for (int i = px + 1; true; i++)
                {
                    if (i >= 15)
                    {
                        block++;
                        break;
                    }
                    var t = board[i, py];
                    if (t == (int)AiConfig.player.empty)
                    {
                        if (empty == -1 && i < 15 - 1 && board[i + 1, py] == role)
                        {
                            empty = count;
                            continue;
                        }
                        else
                        {
                            break;
                        }
                    }
                    if (t == role)
                    {
                        count++;
                        continue;
                    }
                    else
                    {
                        block++;
                        break;
                    }
                }

                for (int i = px - 1; true; i--)
                {
                    if (i < 0)
                    {
                        block++;
                        break;
                    }
                    var t = board[i, py];
                    if (t == (int)AiConfig.player.empty)
                    {
                        if (empty == -1 && i > 0 && board[i - 1, py] == role)
                        {
                            empty = 0;  //注意这里是0，因为是从右往左走的
                            continue;
                        }
                        else
                        {
                            break;
                        }
                    }
                    if (t == role)
                    {
                        secondCount++;
                        if (empty != -1) empty++;
                        continue;
                    }
                    else
                    {
                        block++;
                        break;
                    }
                }

                count += secondCount;

                scoreCache[role][1][px, py] = countToScore(count, block, empty);
            }
            result += scoreCache[role][1][px, py];

            if (dir == 2 || dir == -1)
            {
                reset();
                for (int i = 1; true; i++)
                {
                    var x = px + i;
                    var y = py + i;
                    if (x >= 15 || y >= 15)
                    {
                        block++;
                        break;
                    }
                    var t = board[x, y];
                    if (t == (int)AiConfig.player.empty)
                    {
                        if (empty == -1 && (x < 15 - 1 && y < 15 - 1) && board[x + 1, y + 1] == role)
                        {
                            empty = count;
                            continue;
                        }
                        else
                        {
                            break;
                        }
                    }
                    if (t == role)
                    {
                        count++;
                        continue;
                    }
                    else
                    {
                        block++;
                        break;
                    }
                }

                for (int i = 1; true; i++)
                {
                    var x = px - i;
                    var y = py - i;
                    if (x < 0 || y < 0)
                    {
                        block++;
                        break;
                    }
                    var t = board[x, y];
                    if (t == (int)AiConfig.player.empty)
                    {
                        if (empty == -1 && (x > 0 && y > 0) && board[x - 1, y - 1] == role)
                        {
                            empty = 0;  //注意这里是0，因为是从右往左走的
                            continue;
                        }
                        else
                        {
                            break;
                        }
                    }
                    if (t == role)
                    {
                        secondCount++;
                        if (empty != -1) empty++;
                        continue;
                    }
                    else
                    {
                        block++;
                        break;
                    }
                }

                count += secondCount;

                scoreCache[role][2][px, py] = countToScore(count, block, empty);
            }
            result += scoreCache[role][2][px, py];

            if (dir == 3 || dir == -1)
            {
                reset();
                for (int i = 1; true; i++)
                {
                    var x = px + i;
                    var y = py - i;
                    if (x < 0 || y < 0 || x >= 15 || y >= 15)
                    {
                        block++;
                        break;
                    }
                    var t = board[x, y];
                    if (t == (int)AiConfig.player.empty)
                    {
                        if (empty == -1 && (x < 15 - 1 && y > 0) && board[x + 1, y - 1] == role)
                        {
                            empty = count;
                            continue;
                        }
                        else
                        {
                            break;
                        }
                    }
                    if (t == role)
                    {
                        count++;
                        continue;
                    }
                    else
                    {
                        block++;
                        break;
                    }
                }

                for (int i = 1; true; i++)
                {
                    var x = px - i;
                    var y = py + i;
                    if (x < 0 || y < 0 || x >= 14 || y >= 14)
                    {
                        block++;
                        break;
                    }
                    var t = board[x, y];
                    if (t == (int)AiConfig.player.empty)
                    {
                        if (empty == -1 && (x > 0 && y > 0) && board[x - 1, y + 1] == role)
                        {
                            empty = 0;  //注意这里是0，因为是从右往左走的
                            continue;
                        }
                        else
                        {
                            break;
                        }
                    }
                    if (t == role)
                    {
                        secondCount++;
                        if (empty != -1) empty++;
                        continue;
                    }
                    else
                    {
                        block++;
                        break;
                    }
                }

                count += secondCount;

                scoreCache[role][3][px, py] = countToScore(count, block, empty);
            }
            result += scoreCache[role][3][px, py];

            return result;
        }

        private int countToScore(int count, int block, int empty)
        {
            if (empty <= 0)
            {
                if (count >= 5) return (int)AiConfig.score.five;
                if (block == 0)
                {
                    switch (count)
                    {
                        case 1: return (int)AiConfig.score.one;
                        case 2: return (int)AiConfig.score.two;
                        case 3: return (int)AiConfig.score.three;
                        case 4: return (int)AiConfig.score.four;
                    }
                }
                if (block == 1)
                {
                    switch (count)
                    {
                        case 1: return (int)AiConfig.score.block_one;
                        case 2: return (int)AiConfig.score.block_two;
                        case 3: return (int)AiConfig.score.block_three;
                        case 4: return (int)AiConfig.score.block_four;
                    }
                }
            }
            else if (empty == 1 || empty == count - 1)
            {
                if (count >= 6) return (int)AiConfig.score.five;
                if (block == 0)
                {
                    switch (count)
                    {
                        case 2: return (int)AiConfig.score.two / 2;
                        case 3: return (int)AiConfig.score.three;
                        case 4: return (int)AiConfig.score.block_four;
                        case 5: return (int)AiConfig.score.four;
                    }
                }
                if (block == 1)
                {
                    switch (count)
                    {
                        case 2: return (int)AiConfig.score.block_two;
                        case 3: return (int)AiConfig.score.block_three;
                        case 4: return (int)AiConfig.score.block_four;
                        case 5: return (int)AiConfig.score.block_four;
                    }
                }
            }
            else if (empty == 2 || empty == count - 2)
            {
                if (count >= 7) return (int)AiConfig.score.five;
                if (block == 0)
                {
                    switch (count)
                    {
                        case 3: return (int)AiConfig.score.three;
                        case 4:
                        case 5: return (int)AiConfig.score.block_four;
                        case 6: return (int)AiConfig.score.four;
                    }
                }
                if (block == 1)
                {
                    switch (count)
                    {
                        case 3: return (int)AiConfig.score.block_three;
                        case 4: return (int)AiConfig.score.block_four;
                        case 5: return (int)AiConfig.score.block_four;
                        case 6: return (int)AiConfig.score.four;
                    }
                }
                if (block == 2)
                {
                    switch (count)
                    {
                        case 4:
                        case 5:
                        case 6: return (int)AiConfig.score.block_four;
                    }
                }
            }
            else if (empty == 3 || empty == count - 3)
            {
                if (count >= 8) return (int)AiConfig.score.five;
                if (block == 0)
                {
                    switch (count)
                    {
                        case 4:
                        case 5: return (int)AiConfig.score.three;
                        case 6: return (int)AiConfig.score.block_four;
                        case 7: return (int)AiConfig.score.four;
                    }
                }
                if (block == 1)
                {
                    switch (count)
                    {
                        case 4:
                        case 5:
                        case 6: return (int)AiConfig.score.block_four;
                        case 7: return (int)AiConfig.score.four;
                    }
                }
                if (block == 1)
                {
                    switch (count)
                    {
                        case 4:
                        case 5:
                        case 6:
                        case 7: return (int)AiConfig.score.block_four;
                    }
                }
            }
            else if (empty == 4 || empty == count - 4)
            {
                if (count >= 9) return (int)AiConfig.score.five;
                if (block == 0)
                {
                    switch (count)
                    {
                        case 5:
                        case 6:
                        case 7:
                        case 8: return (int)AiConfig.score.four;
                    }
                }
                if (block == 1)
                {
                    switch (count)
                    {
                        case 4:
                        case 5:
                        case 6:
                        case 7: return (int)AiConfig.score.block_four;
                        case 8: return (int)AiConfig.score.four;
                    }
                }
                if (block == 2)
                {
                    switch (count)
                    {
                        case 5:
                        case 6:
                        case 7:
                        case 8: return (int)AiConfig.score.block_four;
                    }
                }
            }
            else if (empty == 4 || empty == count - 4)
            {
                return (int)AiConfig.score.five;
            }

            return 0;
        }
        private bool starTo(Point point, List<Point> points)
        {
            if (points.Count == 0)
            {
                return false;
            }
            var a = point;
            for (int i = 0; i < points.Count; i++)
            {
                var b = points[i];
                // 距离必须在5步以内
                if (Math.Abs(a.p[0] - b.p[0]) > 4 || Math.Abs(a.p[0] - b.p[0]) > 4)
                {
                    return false;
                }
                // 必须在米子方向上
                if (!(a.p[0] == b.p[0] || a.p[1] == b.p[1] || (Math.Abs(a.p[0] - b.p[0]) == Math.Abs(a.p[1] - b.p[1]))))
                {
                    return false;
                }
            }
            return true;
        }
        public List<Point> gen(int role, bool onlyThrees = false, bool starspread = false)
        {
            if (count <= 0)
            {
                return new List<Point> { new Point(7, 7) };
            }
            List<Point> fives = new List<Point>();
            List<Point> comfours = new List<Point>();
            List<Point> humfours = new List<Point>();
            List<Point> comblockedfours = new List<Point>();
            List<Point> humblockedfours = new List<Point>();
            List<Point> comtwothrees = new List<Point>();
            List<Point> humtwothrees = new List<Point>();
            List<Point> comthrees = new List<Point>();
            List<Point> humthrees = new List<Point>();
            List<Point> comtwos = new List<Point>();
            List<Point> humtwos = new List<Point>();
            List<Point> neighbors = new List<Point>();

            var reverseRole = role == 1 ? 2 : 1;
            // 找到双方的最后进攻点
            List<Point> attackPoints = new List<Point>();
            List<Point> defendPoints = new List<Point>();

            // 默认情况下 我们遍历整个棋盘。但是在开启star模式下，我们遍历的范围就会小很多
            // 只需要遍历以两个点为中心正方形。
            // 注意除非专门处理重叠区域，否则不要把两个正方形分开算，因为一般情况下这两个正方形会有相当大的重叠面积，别重复计算了
            if (AiConfig.starspread)
            {
                var i = currentSteps.Count - 1;
                while (i >= 0)
                {
                    var p = currentSteps[i];
                    if (reverseRole == (int)AiConfig.player.com && p.scoreCom >= (int)AiConfig.score.three
                      || reverseRole == (int)AiConfig.player.hum && p.scoreHum >= (int)AiConfig.score.three)
                    {
                        defendPoints.Add(p);
                        break;
                    }
                    i -= 2;
                }

                var j = currentSteps.Count - 2;
                while (j >= 0)
                {
                    var p = currentSteps[j];
                    if (role == (int)AiConfig.player.com && p.scoreCom >= (int)AiConfig.score.three
                      || role == (int)AiConfig.player.hum && p.scoreHum >= (int)AiConfig.score.three)
                    {
                        defendPoints.Add(p);
                        break;
                    }
                    j -= 2;
                }
                if (attackPoints.Count != 0)
                {
                    attackPoints.Add(currentSteps[0].role == role ? currentSteps[0] : currentSteps[1]);
                }
                if (defendPoints.Count != 0)
                {
                    defendPoints.Add(currentSteps[0].role == reverseRole ? currentSteps[0] : currentSteps[1]);
                }
            }
            for (int i = 0; i < 15; i++)
            {
                for (int j = 0; j < 15; j++)
                {
                    if (board[i, j] == (int)AiConfig.player.empty)
                    {

                        if (allSteps.Count < 6)
                        {
                            if (!hasNeighbor(i, j, 1, 1))
                            {
                                continue;
                            }
                        }
                        else if (!hasNeighbor(i, j, 2, 2))
                        {
                            continue;
                        }

                        var scoreHum = humScore[i, j];
                        var scoreCom = comScore[i, j];
                        var maxScore = Math.Max(scoreHum, scoreCom);

                        if (onlyThrees && maxScore < (int)AiConfig.score.three)
                        {
                            continue;
                        }

                        var p = new Point(i, j);
                        p.scoreCom = scoreCom;
                        p.scoreCom = scoreCom;
                        p.score = maxScore;
                        p.role = role;

                        total++;

                        /* 双星延伸，以提升性能
                        * 思路：每次下的子，只可能是自己进攻，或者防守对面（也就是对面进攻点）
                        * 我们假定任何时候，绝大多数情况下进攻的路线都可以按次序连城一条折线，那么每次每一个子，一定都是在上一个己方棋子的八个方向之一。
                        * 因为既可能自己进攻，也可能防守对面，所以是最后两个子的米子方向上
                        * 那么极少数情况，进攻路线无法连成一条折线呢?很简单，我们对前双方两步不作star限制就好，这样可以 兼容一条折线中间伸出一段的情况
                        */
                        if (AiConfig.starspread && starspread)
                        {
                            if (maxScore >= (int)AiConfig.score.four) { }
                            else if (maxScore >= (int)AiConfig.score.block_four && starTo(currentSteps[currentSteps.Count - 1], defendPoints)) { }
                            //star 路径不是很准，所以考虑冲四防守对手最后一步的棋
                            else if (starTo(p, attackPoints) || starTo(p, defendPoints)) { }
                            else
                            {
                                count++;
                                continue;
                            }
                        }

                        if (scoreCom >= (int)AiConfig.score.five) //先看电脑能不能连成5
                        {
                            fives.Add(p);
                        }
                        else if (scoreHum >= (int)AiConfig.score.five) //再看玩家能不能连成5
                        {
                            //别急着返回，因为遍历还没完成，说不定电脑自己能成五。
                            fives.Add(p);
                        }
                        else if (scoreCom >= (int)AiConfig.score.four)
                        {
                            comfours.Add(p);
                        }
                        else if (scoreHum >= (int)AiConfig.score.four)
                        {
                            humfours.Add(p);
                        }
                        else if (scoreCom >= (int)AiConfig.score.block_four)
                        {
                            comblockedfours.Add(p);
                        }
                        else if (scoreHum >= (int)AiConfig.score.block_four)
                        {
                            humblockedfours.Add(p);
                        }
                        else if (scoreCom >= 2 * (int)AiConfig.score.three) // 检查双三
                        {
                            comtwothrees.Add(p);
                        }
                        else if (scoreHum >= 2 * (int)AiConfig.score.three)
                        {
                            humtwothrees.Add(p);
                        }
                        else if (scoreCom >= (int)AiConfig.score.three)
                        {
                            comthrees.Add(p);
                        }
                        else if (scoreHum >= (int)AiConfig.score.three)
                        {
                            humthrees.Add(p);
                        }
                        else if (scoreCom >= (int)AiConfig.score.two)
                        {
                            comtwos.Insert(0, p);
                        }
                        else if (scoreHum >= (int)AiConfig.score.two)
                        {
                            humtwos.Insert(0, p);
                        }
                        else
                        {
                            neighbors.Add(p);
                        }
                    }
                }
            }

            //如果成五，是必杀棋，直接返回
            if (fives.Count != 0)
            {
                return fives;
            }

            // 自己能活四，则直接活四，不考虑冲四
            if (role == (int)AiConfig.player.com && comfours.Count != 0)
            {
                return comfours;
            }
            if (role == (int)AiConfig.player.hum && humfours.Count != 0)
            {
                return humfours;
            }

            // 对面有活四冲四，自己冲四都没，则只考虑对面活四 （此时对面冲四就不用考虑了)
            if (role == (int)AiConfig.player.com && humfours.Count != 0 && comblockedfours.Count == 0)
            {
                return humfours;
            }
            if (role == (int)AiConfig.player.hum && comfours.Count != 0 && humblockedfours.Count == 0)
            {
                return comfours;
            }

            // 对面有活四自己有冲四，则都考虑下
            var fours = role == (int)AiConfig.player.com ? comfours.Union(humfours).ToList<Point>() : humfours.Union(comfours).ToList<Point>();
            var blockedfour = role == (int)AiConfig.player.com ? comblockedfours.Union(humblockedfours).ToList<Point>() : humblockedfours.Union(comblockedfours).ToList<Point>();
            if (fours.Count != 0)
            {
                return fours.Union(blockedfour).ToList<Point>();
            }

            var result = new List<Point>();
            if (role == (int)AiConfig.player.com)
            {
                result = result.Union(comtwothrees).ToList<Point>();
                result = result.Union(humtwothrees).ToList<Point>();
                result = result.Union(comblockedfours).ToList<Point>();
                result = result.Union(humblockedfours).ToList<Point>();
                result = result.Union(comthrees).ToList<Point>();
                result = result.Union(humthrees).ToList<Point>();
            }
            if (role == (int)AiConfig.player.hum)
            {
                result = result.Union(humtwothrees).ToList<Point>();
                result = result.Union(comtwothrees).ToList<Point>();
                result = result.Union(humblockedfours).ToList<Point>();
                result = result.Union(comblockedfours).ToList<Point>();
                result = result.Union(humthrees).ToList<Point>();
                result = result.Union(comthrees).ToList<Point>();
            }

            // 双三很特殊，因为能形成双三的不一定比一个活三强
            if (comtwothrees.Count != 0 || humtwothrees.Count != 0)
            {
                return result;
            }

            // 只返回大于等于活三的棋
            if (onlyThrees)
            {
                return result;
            }

            var twos = new List<Point>();
            if (role == (int)AiConfig.player.com)
            {
                comtwos.Union(humtwos).ToList<Point>().ForEach(i => twos.Add(i));
            }
            else
            {
                humtwos.Union(comtwos).ToList<Point>().ForEach(i => twos.Add(i));
            }

            twos.Sort((a, b) => { return b.score - a.score; });
            result = result.Union(twos.Count != 0 ? twos : neighbors).ToList<Point>();

            //这种分数低的，就不用全部计算了
            if (result.Count > AiConfig.countLimit)
            {
                return result.Take(AiConfig.countLimit).ToList<Point>();
            }
            return result;
        }

        //棋面估分
        //这里只算当前分，而不是在空位下一步之后的分
        public int evaluate(int role)
        {
            // 这里都是用正整数初始化的，所以初始值是0
            var comMaxScore = 0;
            var humMaxScore = 0;

            for (int i = 0; i < 15; i++)
            {
                for (int j = 0; j < 15; j++)
                {
                    if (board[i, j] == (int)AiConfig.player.com)
                    {
                        comMaxScore += fixScore(comScore[i, j]);
                    }
                    else if (board[i, j] == (int)AiConfig.player.hum)
                    {
                        humMaxScore += fixScore(humScore[i, j]);
                    }
                }
            }

            // 有冲四延伸了，不需要专门处理冲四活三
            // 不过这里做了这一步，可以减少电脑胡乱冲四的毛病
            var result = (role == (int)AiConfig.player.com ? 1 : -1) * (comMaxScore - humMaxScore);

            return result;
        }

        private int fixScore(int type)
        {
            if (type < (int)AiConfig.score.four && type >= (int)AiConfig.score.block_four)
            {
                if (type >= (int)AiConfig.score.block_four && type < ((int)AiConfig.score.block_four + (int)AiConfig.score.three))
                {
                    //单独冲四，意义不大
                    return (int)AiConfig.score.three;
                }
                else if (type >= (int)AiConfig.score.block_four + (int)AiConfig.score.three && type < (int)AiConfig.score.block_four * 2)
                {
                    //冲四活三，比双三分高，相当于自己形成活四
                    return (int)AiConfig.score.four;
                }
                else
                {
                    //双冲四 比活四分数也高
                    return (int)AiConfig.score.four * 2;
                }
            }
            return type;
        }
    }
}
