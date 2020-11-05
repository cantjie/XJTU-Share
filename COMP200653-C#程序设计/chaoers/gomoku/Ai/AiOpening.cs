using System;
using System.Collections.Generic;
using System.Text;

namespace backgammon
{
    class AiOpening
    {
        public int[] match(AiBoard board)
        {
            var s = board.allSteps;
            if (board.board[s[0].p[0], s[0].p[1]] != 1) return new int[] { -1, -1 };
            if (s.Count > 2) return new int[] { -1, -1 };
            if (new List<int[]> { new int[] { 6, 7 }, new int[] { 7, 6 }, new int[] { 8, 7 }, new int[] { 7, 8 } }.Contains(s[1].p)) return huayue(board);
            else if (new List<int[]> { new int[] { 6, 6 }, new int[] { 8, 8 }, new int[] { 8, 6 }, new int[] { 6, 8 } }.Contains(s[1].p)) return puyue(board);
            return new int[] { -1, -1 };
        }

        private int[] huayue(AiBoard board)
        {
            var s = board.allSteps;
            if (new int[] { 6, 7 } == s[1].p)
            {
                if (s.Count == 2) return new int[] { 6, 8 };
            }
            if (new int[] { 7, 6 } == s[1].p)
            {
                if (s.Count == 2) return new int[] { 6, 6 };
            }
            if (new int[] { 8, 7 } == s[1].p)
            {
                if (s.Count == 2) return new int[] { 8, 6 };
            }
            if (new int[] { 7, 8 } == s[1].p)
            {
                if (s.Count == 2) return new int[] { 8, 8 };
            }
            return new int[] { -1, -1 };
        }

        private int[] puyue(AiBoard board)
        {
            var s = board.allSteps;
            if (new int[] { 6, 6 } == s[1].p)
            {
                if (s.Count == 2) return new int[] { 6, 8 };
            }
            if (new int[] { 8, 6 } == s[1].p)
            {
                if (s.Count == 2) return new int[] { 6, 6 };
            }
            if (new int[] { 8, 8 } == s[1].p)
            {
                if (s.Count == 2) return new int[] { 8, 6 };
            }
            if (new int[] { 6, 8 } == s[1].p)
            {
                if (s.Count == 2) return new int[] { 8, 8 };
            }
            return new int[] { -1, -1 };
        }
    }
}
