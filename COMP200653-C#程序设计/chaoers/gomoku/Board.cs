using System;
using System.Collections.Generic;
using System.Text;

namespace backgammon
{
    class Board
    {
        public int[,] pieceNum = new int[15, 15];
        // 0-没有棋子 1-有黑棋 2-有白棋
        private static readonly int DISTANCE = 40;
        private static readonly int RADIUS = 10;

        public void clearPiece()
        {
            pieceNum = new int[15, 15];
        }
        public int[] placePosition(double x, double y)
        {
            var position = new int[2];
            position[0] = closeNode(x+30);
            position[1] = closeNode(y+30);
            if(position[0] != -1 && position[1] != -1 && pieceNum[position[0],position[1]] == 0)
            {
                return position;
            }
            else
            {
                return new int[] {-1,-1};
            }
        }
        public int closeNode(double position)
        {
            if(position%DISTANCE >= RADIUS && position%DISTANCE <= DISTANCE - RADIUS)
            {
                return -1;
            }
            else
            {
                if(position%DISTANCE >= RADIUS)
                {
                    return (int)position / DISTANCE;
                }
                else
                {
                    return (int)position / DISTANCE -1;
                }
            }
        }
    }
}
