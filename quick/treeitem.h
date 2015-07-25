#ifndef TREEITEM_H
#define TREEITEM_H

#include <QObject>
#include <QColor>

class TreeItem : public QObject
{
    Q_OBJECT
public:
    explicit TreeItem(const QString &content, const QColor &color, TreeItem *parent = 0, bool isOpen = true);

    Q_PROPERTY(QString content READ content NOTIFY contentChanged)
    const QString & content() const;
    void setContent(const QString & content);

    Q_PROPERTY(QColor color READ color NOTIFY colorChanged)
    QColor color() const;
    void setColor(const QColor &color);

    Q_PROPERTY(bool selected READ selected WRITE setSelected NOTIFY selectedChanged)
    bool selected() const;
    void setSelected(bool selected);

    Q_PROPERTY(int level READ level NOTIFY levelChanged)
    int level() const;
    void setLevel(int level);

    Q_PROPERTY(int childCount READ childCount NOTIFY levelChanged)
    int childCount() const;

    Q_PROPERTY(int index READ index)
    int index() const;

    Q_PROPERTY(QColor levelColor READ levelColor NOTIFY levelColorChanged)
    QColor levelColor() const;
    void setLevelColor(QColor levelColor);


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
    void selectedChanged();
    void levelChanged();
    void levelColorChanged();
    void childItemsChanged();
    void isOpenChanged();
    void hasChildChanged();

public slots:

private:
    static TreeItem *s_selected;

    TreeItem *m_parentItem;
    QString m_content;
    QColor m_color;
    bool m_selected;
    int m_level;
    QColor m_levelColor;
    QList<TreeItem *> m_childItems;
    bool m_isOpen;
};

#endif // TREEITEM_H
