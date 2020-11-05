using System;
using System.Collections.Generic;
using System.Text;

namespace backgammon
{
    static class AiMath
    {
        public static double threshold = 1.15;
        public static bool equal(double a, double b = 0.01)
        {
            return b >= 0 ? ((a >= b / threshold) && (a <= b * threshold)) : ((a >= b * threshold) && (a <= b / threshold));
        }
        public static bool greatThan(double a, double b)
        {
            return b >= 0 ? (a >= (b + 0.1) * threshold) : (a >= (b + 0.1) / threshold); // 注意处理b为0的情况，通过加一个0.1 做简单的处理
        }
        public static bool greatOrEqualThan(double a, double b)
        {
            return equal(a, b) || greatThan(a, b);
        }
        public static bool littleThan(double a, double b)
        {
            return b >= 0 ? (a <= (b - 0.1) / threshold) : (a <= (b - 0.1) * threshold);
        }
        public static bool littleOrEqualThan(double a, double b)
        {
            return equal(a, b) || littleThan(a, b);
        }
        public static int round(int score)
        {
            var neg = score < 0 ? -1 : 1;
            var abs = Math.Abs(score);
            if (abs <= (int)AiConfig.score.one / 2) return 0;
            if (abs <= (int)AiConfig.score.two / 2 && abs > (int)AiConfig.score.one / 2) return neg * (int)AiConfig.score.one;
            if (abs <= (int)AiConfig.score.three / 2 && abs > (int)AiConfig.score.two / 2) return neg * (int)AiConfig.score.two;
            if (abs <= (int)AiConfig.score.three * 1.5 && abs > (int)AiConfig.score.three / 2) return neg * (int)AiConfig.score.three;
            if (abs <= (int)AiConfig.score.four / 2 && abs > (int)AiConfig.score.three * 1.5) return neg * (int)AiConfig.score.three * 2;
            if (abs <= (int)AiConfig.score.five / 2 && abs > (int)AiConfig.score.four / 2) return neg * (int)AiConfig.score.four;
            return neg * (int)AiConfig.score.five;
        }
    }
}
