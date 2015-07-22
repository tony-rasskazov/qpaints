#include <QApplication>
#include <QGraphicsScene>
#include <QGraphicsView>
#include <QPainter>
#include <QTime>
#include <QPen>
#include <math.h>

int lrand(int low, int high) {
  return qrand() % ((high + 1) - low) + low;
}

class Scene: public QGraphicsScene {
public:

    int rb = 40, rj = 30;
    
    virtual void drawForeground(QPainter *painter, const QRectF &rect)
    {
        painter->translate(0.0, rect.height() / 2);
        QPen pen;
        pen.setWidth(7);
        painter->setPen(pen);
        painter->setRenderHints(QPainter::HighQualityAntialiasing | QPainter::Antialiasing);
        drawBranch(painter, rect, 13);
    }

    void drawBranch(QPainter *p, const QRectF &rect, int depth)
    {
        qreal h = rect.height();
        if (depth > 0) {
            p->drawLine(QPointF(0.0, 0.0), QPointF(0.0, -h * 0.15));
            p->translate(0.0, -h * 0.15);
            p->rotate(lrand(-25, 25));
            if (lrand(0, 10) < 6)
            {
                p->scale(0.85, 0.85);
                p->save(); p->rotate(lrand(rb - rj, rb + rj) ); drawBranch(p, rect, depth - 1); p->restore();
                p->save(); p->rotate(lrand(-rb - rj, -rb + rj)); drawBranch(p, rect, depth - 1); p->restore();
            } else { p->scale(0.7, 0.7); drawBranch(p, rect, depth); }
        }
    }
};

int main(int argc, char *argv[])
{
    qsrand(QTime::currentTime().msec());
    QApplication a(argc, argv);
    Scene scene;
    QGraphicsView view(&scene);
    view.show();
    return a.exec();
}
