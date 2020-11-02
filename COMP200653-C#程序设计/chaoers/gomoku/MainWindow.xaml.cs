using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Shapes;
using System.Windows.Media.Animation;

namespace backgammon
{
    public partial class MainWindow : Window
    {
        private Ai ai;
        private bool isAi = false;
        private bool isWinBool = true;
        private bool isWaiting = false;
        private bool color = true;
        // 1-黑 0-白
        private static Board mainboard = new Board();
        public MainWindow()
        {
            InitializeComponent();
    
            MouseDown += (s, e) => pan_MouseDown(s, e); // 监听鼠标移动
            addButton();

            logText.AppendText("五子棋小游戏\n");
            logText.AppendText("author:Fan Guofan\n");
            logText.AppendText("GITHUB:https://github.com/chaoers/gomoku\n");
            logText.AppendText("If you like it,please give me a star!\n");
            logText.AppendText(DateTime.Now.ToString("[yyyy-MM-dd HH:mm:ss]"));
            logText.AppendText("初始化完成,默认模式为玩家对战模式,请点击构建棋盘开始游戏\n");
        }

        // public bool IsVerticalScrollBarAtBottom
        // {
        //     get
        //     {
        //         bool atBottom = false;

        //         logText.Dispatcher.Invoke((Action)delegate
        //         {
        //             double dVer = logText.VerticalOffset;       //获取竖直滚动条滚动位置
        //             double dViewport = logText.ViewportHeight;  //获取竖直可滚动内容高度
        //             double dExtent = logText.ExtentHeight;      //获取可视区域的高度

        //             if (dVer + dViewport >= dExtent)
        //             {
        //                 atBottom = true;
        //             }
        //             else
        //             {
        //                 atBottom = false;
        //             }
        //         });

        //         return atBottom;
        //     }
        // }

        private void multiplayer(object sender, RoutedEventArgs e)
        {
            logText.AppendText(DateTime.Now.ToString("[yyyy-MM-dd HH:mm:ss]"));
            logText.AppendText("切换为玩家对战，请点击构建棋盘开始游戏\n");
            pan.Children.Clear();
            Button btn = pan.FindName("drawButton") as Button;
            if (btn != null)
            {
                pan.UnregisterName("drawButton");
            }
            addButton();
            mainboard.clearPiece();
            isAi = false;
            color = true;
        }
        private void singleplayer(object sender, RoutedEventArgs e)
        {
            logText.AppendText(DateTime.Now.ToString("[yyyy-MM-dd HH:mm:ss]"));
            logText.AppendText("切换为AI对战，请点击构建棋盘开始游戏\n");
            logText.AppendText(DateTime.Now.ToString("[yyyy-MM-dd HH:mm:ss]"));
            logText.AppendText("本AI采用极小化极大值搜索+Alpha-Beta剪枝算法+启发式评估函数+算杀单元构成\n");
            logText.AppendText(DateTime.Now.ToString("[yyyy-MM-dd HH:mm:ss]"));
            logText.AppendText("搜索深度"+AiConfig.searchDeep.ToString()+ " 节点数量上限"+AiConfig.countLimit.ToString()+ " 算杀深度"+AiConfig.vcxDeep.ToString()+"\n");
            ai = new Ai();
            ai.start();
            pan.Children.Clear();
            Button btn = pan.FindName("drawButton") as Button;
            if(btn != null)
            {
                pan.UnregisterName("drawButton");
            }
            addButton();
            mainboard.clearPiece();
            isAi = true;
            color = true;
        }

        private BlackPiece addBlack(int X, int Y)
        {
            var black = new BlackPiece();
            pan.Children.Add(black);
            Canvas.SetLeft(black, X-15);
            Canvas.SetTop(black, Y-15);
            logText.AppendText(DateTime.Now.ToString("[yyyy-MM-dd HH:mm:ss]"));
            logText.AppendText("黑棋下子，位置为" + "[" + ((X-10)/40).ToString() + "," + ((Y - 10) / 40).ToString() + "]\n");
            return black;
        }
        private WhitePiece addWhite(int X, int Y)
        {
            var white = new WhitePiece();
            pan.Children.Add(white);
            Canvas.SetLeft(white, X-15);
            Canvas.SetTop(white, Y-15);
            logText.AppendText(DateTime.Now.ToString("[yyyy-MM-dd HH:mm:ss]"));
            logText.AppendText("白棋下子，位置为" + "[" + ((X - 10) / 40).ToString() + "," + ((Y - 10) / 40).ToString() + "]\n");
            return white;
        }

        private void startDraw()
        {
            isWaiting = true;
            logText.AppendText(DateTime.Now.ToString("[yyyy-MM-dd HH:mm:ss]"));
            logText.AppendText("开始构建棋盘\n");
            var storyboard = new Storyboard();
            for (int i = 0; i < 15; i++)
            {
                var start = new Point(10+i*40,10);
                var end = new Point(10+i*40,570);
                
                var line = new LineGeometry(start,start);
                RegisterName("line_0"+i,line);

                var path = new Path()
                {
                    Stroke = Brushes.DarkSlateGray,
                    StrokeThickness = 2,
                    Data = line
                };

                pan.Children.Add(path);
                var animation = new PointAnimation(start, end, new Duration(TimeSpan.FromSeconds(3)))
                {
                    BeginTime = TimeSpan.FromMilliseconds(i * 214)
                };
                storyboard.Children.Add(animation);
                Storyboard.SetTargetName(animation, "line_0"+i);
                Storyboard.SetTargetProperty(animation, new PropertyPath(LineGeometry.EndPointProperty));
            }
            for (int i = 0; i < 15; i++)
            {
                var start = new Point(10, 10+i*40);
                var end = new Point(570, 10+i*40);

                var line = new LineGeometry(start, start);
                RegisterName("line_1" + i, line);

                var path = new Path()
                {
                    Stroke = Brushes.DarkSlateGray,
                    StrokeThickness = 2,
                    Data = line
                };

                pan.Children.Add(path);
                var animation = new PointAnimation(start, end, new Duration(TimeSpan.FromSeconds(3)))
                {
                    BeginTime = TimeSpan.FromMilliseconds(i * 200)
                };
                storyboard.Children.Add(animation);
                Storyboard.SetTargetName(animation, "line_1" + i);
                Storyboard.SetTargetProperty(animation, new PropertyPath(LineGeometry.EndPointProperty));
            }
            storyboard.Completed += finishDraw;
            storyboard.Begin(this);
            for (int i = 0; i < 15; i++)
            {
                pan.UnregisterName("line_0" + i);
                pan.UnregisterName("line_1" + i);
            }
        }
        private void finishDraw(object sender, EventArgs eventArgs)
        {
            logText.AppendText(DateTime.Now.ToString("[yyyy-MM-dd HH:mm:ss]"));
            logText.AppendText("构建棋盘完成\n");
            isWaiting = false;
            isWinBool = false;
            if (isAi)
            {
                var down = ai.begin();
                downPiece(down[0], down[1]);
            }
        }
        private void addButton()
        {
            isWinBool = false;
            Button btn = new Button()
            {
                Name = "startButton",
                Content = "构建棋盘",
                HorizontalAlignment = HorizontalAlignment.Left,
                Margin = new Thickness(246, 266, 0, 0),
                VerticalAlignment = VerticalAlignment.Top,
                Height = 58,
                Width = 104
            };
            btn.Click += new RoutedEventHandler(drawButton);
            pan.Children.Add(btn);
            pan.RegisterName("drawButton", btn);
        }

        private void drawButton(object sender, RoutedEventArgs e)
        {
            pan.Children.Clear();
            Button btn = pan.FindName("drawButton") as Button;
            pan.UnregisterName("drawButton");
            this.startDraw();
        }

        private void logText_TextChanged(object sender, TextChangedEventArgs e)
        {

        }

        private void pan_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if(e.GetPosition(pan).X >= 0 && e.GetPosition(pan).X <= 570 
                && e.GetPosition(pan).Y >=0 && e.GetPosition(pan).Y <= 570 && isWinBool == false && isWaiting == false)
            {
                int[] position = mainboard.placePosition(e.GetPosition(pan).X, e.GetPosition(pan).Y);
                if(position[0] != -1) 
                {
                    downPiece(position[0], position[1]);
                }
            }
        }

        private void Grid_MouseMove(object sender, MouseEventArgs e)
        {
            logText.Dispatcher.BeginInvoke((Action)delegate
            {
                // if (IsVerticalScrollBarAtBottom)
                // {
                logText.ScrollToEnd();
                // }
            });
            if (e.GetPosition(pan).X >= 0 && e.GetPosition(pan).X <= 570
                && e.GetPosition(pan).Y >= 0 && e.GetPosition(pan).Y <= 570 && isWinBool == false)
            {
                int[] position = mainboard.placePosition(e.GetPosition(pan).X, e.GetPosition(pan).Y);
                if (position[0] != -1)
                {
                    this.Cursor = Cursors.Hand;
                }
                else
                {
                    this.Cursor = Cursors.Arrow;
                }
            }
            else
            {
                this.Cursor = Cursors.Arrow;
            }
        }

        private void downPiece(int X,int Y)
        {
            if (!isWinBool)
            {

            if (color)
            {
                mainboard.pieceNum[X, Y] = 1;
                addBlack(X * 40 + 10, Y * 40 + 10);
                var win = isWin(X, Y);
                if(win == true)
                {
                    logText.AppendText(DateTime.Now.ToString("[yyyy-MM-dd HH:mm:ss]"));
                    logText.AppendText("游戏结束，黑棋胜利\n");
                    if (isAi)
                    {
                        ai = new Ai();
                        ai.start();
                    }
                    mainboard.clearPiece();
                    addButton();
                    isWinBool = true;
                    color = true;
                }
                else
                {
                    color = false;
                }
            }
            else
            {
                mainboard.pieceNum[X, Y] = 2;
                addWhite(X * 40 + 10, Y * 40 + 10);
                var win = isWin(X, Y);
                if (win == true)
                {
                    logText.AppendText(DateTime.Now.ToString("[yyyy-MM-dd HH:mm:ss]"));
                    logText.AppendText("游戏结束，白棋胜利\n");
                    if (isAi)
                    {
                        ai = new Ai();
                        ai.start();
                    }
                    mainboard.clearPiece();
                    addButton();
                    isWinBool = true;
                    color = true;
                }
                else
                {
                    color = true;
                    if (isAi)
                    {
                        isWaiting = true;
                        var down = ai.turn(X, Y);
                        downPiece(down[0], down[1]);
                        isWaiting = false;
                    }
                }
            }
            }
        }

        private bool isWin(int X,int Y)
        {
            var Z = color ? 1 : 2;
            // 横向查找
            var left = 0;
            for(int i = X;i >= 0; i--)
            {
                if(mainboard.pieceNum[i,Y] != Z)
                {
                    break;
                }
                left++;
            }
            var right = 0;
            for (int i = X; i < 15; i++)
            {
                if (mainboard.pieceNum[i, Y] != Z)
                {
                    break;
                }
                right++;
            }
            if(left + right > 5)
            {
                return true;
            }
            // 竖向查找
            var top = 0;
            for (int i = Y; i >= 0; i--)
            {
                if (mainboard.pieceNum[X, i] != Z)
                {
                    break;
                }
                top++;
            }
            var bottom = 0;
            for (int i = Y; i < 15; i++)
            {
                if (mainboard.pieceNum[X, i] != Z)
                {
                    break;
                }
                bottom++;
            }
            if(top + bottom > 5)
            {
                return true;
            }
            // 左上到右下查找
            var left_top = 0;
            for (int [] i = {X,Y}; i[0]>=0&&i[1] >= 0; i[0]--,i[1]--)
            {
                if (mainboard.pieceNum[i[0], i[1]] != Z)
                {
                    break;
                }
                left_top++;
            }
            var right_bottom = 0;
            for (int[] i = { X, Y }; i[0] < 15 && i[1] < 15; i[0]++, i[1]++)
            {
                if (mainboard.pieceNum[i[0], i[1]] != Z)
                {
                    break;
                }
                right_bottom++;
            }
            if (left_top + right_bottom > 5)
            {
                return true;
            }
            // 右上到左下查找
            var right_top = 0;
            for (int[] i = { X, Y }; i[0] < 15 && i[1] >= 0; i[0]++, i[1]--)
            {
                if (mainboard.pieceNum[i[0], i[1]] != Z)
                {
                    break;
                }
                right_top++;
            }
            var left_bottom = 0;
            for (int[] i = { X, Y }; i[0] >= 0 && i[1] < 15; i[0]--, i[1]++)
            {
                if (mainboard.pieceNum[i[0], i[1]] != Z)
                {
                    break;
                }
                left_bottom++;
            }
            if (right_top + left_bottom > 5)
            {
                return true;
            }
            return false;
        }
    }
}
