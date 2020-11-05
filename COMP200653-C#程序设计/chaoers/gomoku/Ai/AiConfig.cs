using System;
using System.Collections.Generic;
using System.Text;

namespace backgammon
{
    public static class AiConfig
    {
        public static int searchDeep = 8;  //搜索深度
        public static int countLimit = 20; //gen函数返回的节点数量上限，超过之后将会按照分数进行截断
        public static int timeLimit = 100; // 时间限制，秒
        public static int vcxDeep = 5;  //算杀深度
        public static bool random = false;// 在分数差不多的时候是不是随机选择一个走
        // 下面几个设置都是用来提升搜索速度的
        public static int spreadLimit = 1;// 单步延伸 长度限制
        public static bool starspread = true; // 是否开启 starspread
        public static bool cache = false; // 使用缓存, 其实只有搜索的缓存有用，其他缓存几乎无用。因为只有搜索的缓存命中后就能剪掉一整个分支，这个分支一般会包含很多个点。而在其他地方加缓存，每次命中只能剪掉一个点，影响不大。
        public static bool window = false; // 启用期望窗口，由于用的模糊比较，所以和期望窗口是有冲突的

        public enum player {
            hum = 1,
            com = 2,
            empty = 0
        }

        public enum score {
            one = 10,
            two = 100,
            three = 1000,
            four = 100000,
            five = 10000000,
            block_one = 1,
            block_two = 10,
            block_three = 100,
            block_four = 10000
        }
    }
}
