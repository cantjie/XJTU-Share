using System;
using System.Collections.Generic;
using System.Text;

namespace backgammon
{
    class Ai
    {
        public AiBoard aiBoard;
        public AiOpening aiOpening = new AiOpening();

        public AiNegamax aiNegamax;

        // 切换到ai
        public void start(){
            aiBoard = new AiBoard();
            aiBoard.init(15);
            aiNegamax = new AiNegamax();
        }

        // 电脑下棋
        public int[] begin(){
            var p = new AiBoard.Point(-1,-1);
            aiNegamax.init(aiBoard);
            if(aiBoard.allSteps.Count > 1)
            {
                p.p = aiOpening.match(aiBoard);
            }
            if(aiBoard.allSteps.Count <= 1 || p.p[0] == -1){
                p = aiNegamax.deepAll(AiConfig.searchDeep)[0];
            }
            aiBoard.put(p, (int)AiConfig.player.com);
            return p.p;
        }

        public int[] turn(int x, int y){
            set(x,y);
            return begin();
        }

        private void set(int x, int y){
            var p =new AiBoard.Point(x,y);
            aiBoard.put(p, (int)AiConfig.player.hum);
        }
    }
}
