using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Controls;

namespace backgammon
{
    abstract class Piece : Image
    {
        public Piece()
        {
            this.Width = 30;
            this.Height = 30;
        }
    }
}
