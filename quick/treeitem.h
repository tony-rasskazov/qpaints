#ifndef TREEITEM_H
#define TREEITEM_H

#include <QObject>
#include <QColor>

class TreeItem : public QObject
{
    Q_OBJECT
public:
    explicit TreeItem(const QString &content, const QColor &color, TreeItem *parent = 0);

    Q_PROPERTY(QString content READ content NOTIFY contentChanged)
    const QString & content() const;
    void setContent(const QString & content);

    Q_PROPERTY(QColor color READ color NOTIFY colorChanged)
    const QColor & color() const;
    void setColor(const QColor &color);


    Q_PROPERTY(int level READ level NOTIFY levelChanged)
    int level() const;
    void setLevel(int level);


    Q_PROPERTY(QList<QObject*> childItems READ childItemsAsQObject NOTIFY childItemsChanged)
    const QList<TreeItem *> &childItems() const;
    const QList<QObject *> childItemsAsQObject() const;
    void addChildItem(TreeItem * childItem);

    Q_PROPERTY(bool isOpen READ isOpen WRITE setIsOpen NOTIFY isOpenChanged)
    bool isOpen() const;
    void setIsOpen(bool isOpen);

    Q_PROPERTY(bool hasChild READ hasChild NOTIFY hasChildChanged)
    bool hasChild() const;
signals:
    void contentChanged();
    void colorChanged();
    void levelChanged();
    void childItemsChanged();
    void isOpenChanged();
    void hasChildChanged();
public slots:
private:
    QString m_content;
    QColor m_color;
    int m_level;
    QList<TreeItem *> m_childItems;
    bool m_isOpen;
};

#endif // TREEITEM_H
