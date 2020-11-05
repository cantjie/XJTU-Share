using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Media;
using System.Windows.Media.Imaging;

namespace backgammon
{
    class WhitePiece : Piece
    {
        public WhitePiece()
        {
            this.Source = new BitmapImage(new Uri("/Resources/white.png", UriKind.Relative));
        }
    }
}
