using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Media;
using System.Windows.Media.Imaging;

namespace backgammon
{
    class BlackPiece : Piece
    {
        public BlackPiece()
        {
            this.Source = new BitmapImage(new Uri("/Resources/black.png", UriKind.Relative));
        }
    }
}
