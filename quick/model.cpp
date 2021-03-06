#include "model.h"
#include "treeitem.h"

#include <QColor>

const int number = 100;

const QList<QColor> colors = {
    QColor(Qt::blue),
    QColor(Qt::darkCyan),
    QColor(Qt::green),
    QColor(Qt::red),
    QColor(Qt::darkRed),
    QColor(Qt::cyan),
    QColor(Qt::darkGreen),
    QColor(Qt::darkBlue),
};


TreeItem *createTreeItem(const QString &title, TreeItem *parent = 0, bool isOpen = true){
    int level = parent ? parent->level() + 1 : 0;
    auto res = new TreeItem(title, colors.at(level), parent, isOpen);
    return res;
}

Model::Model(QObject *parent) :
    QObject(parent),
    m_tree(QList<TreeItem*>())
{
    auto factory1 = createTreeItem("Завод");

    auto plant1 = createTreeItem("Цех №1", factory1);
    auto c11 = createTreeItem("Компрессор", plant1);

    auto p1 = createTreeItem("Подшипник №1", c11, false);
    createTreeItem("x", p1);
    createTreeItem("y", p1);
    createTreeItem("z", p1);

    p1 = createTreeItem("Подшипник №2", c11);
    createTreeItem("x", p1);
    createTreeItem("y", p1);
    createTreeItem("z", p1);

    auto t11 = createTreeItem("Турбина", plant1, false);
    createTreeItem("обороты", t11);
    createTreeItem("t", t11);
    auto n11 = createTreeItem("Нагнетатель", plant1, false);
    createTreeItem("Вкл", n11);
    createTreeItem("Авария", n11);
    auto d11 = createTreeItem("Диагностика", plant1, false);
    auto d12 = createTreeItem("Вычисляемое значение 1", d11);
    auto d13 = createTreeItem("Вычисляемое значение 2", d12);
    auto d14 = createTreeItem("Вычисляемое значение 3", d13);
    auto d15 = createTreeItem("Вычисляемое значение 4", d14);
    auto d16 = createTreeItem("Вычисляемое значение 5", d15);
    //! todo: защиту от listIndexOutOfBounds
    //! auto d17 = createTreeItem("Вычисляемое значение 5", d16);

    plant1 = createTreeItem("Цех №2", factory1, false);
    c11 = createTreeItem("Компрессор", plant1, false);

    p1 = createTreeItem("Подшипник №1", c11, false);
    createTreeItem("x", p1);
    createTreeItem("y", p1);
    createTreeItem("z", p1);

    t11 = createTreeItem("Турбина", plant1, false);
    createTreeItem("обороты", t11);
    createTreeItem("t", t11);
    n11 = createTreeItem("Нагнетатель", plant1, false);
    createTreeItem("Вкл", n11);
    createTreeItem("Авария", n11);
    d11 = createTreeItem("Диагностика", plant1, false);
    createTreeItem("Вычисляемое значение 1", d11);
    createTreeItem("Вычисляемое значение 2", d11);
    createTreeItem("Вычисляемое значение 3", d11);
    createTreeItem("Вычисляемое значение 4", d11);
    createTreeItem("Вычисляемое значение 5", d11);


    auto factory2 = createTreeItem("Завод 2", 0);

    plant1 = createTreeItem("Цех №1", factory2);
    c11 = createTreeItem("Компрессор", plant1);

    p1 = createTreeItem("Подшипник №1", c11);
    createTreeItem("x", p1);
    createTreeItem("y", p1);
    createTreeItem("z", p1);

    t11 = createTreeItem("Турбина", plant1);
    createTreeItem("обороты", t11);
    createTreeItem("t", t11);
    n11 = createTreeItem("Нагнетатель", plant1);
    createTreeItem("Вкл", n11);
    createTreeItem("Авария", n11);
    d11 = createTreeItem("Диагностика", plant1);
    createTreeItem("Вычисляемое значение 1", d11);
    createTreeItem("Вычисляемое значение 2", d11);
    createTreeItem("Вычисляемое значение 3", d11);
    createTreeItem("Вычисляемое значение 4", d11);
    createTreeItem("Вычисляемое значение 5", d11);


    m_tree.append(factory1);
    m_tree.append(factory2);
}

const QList<TreeItem *> &Model::tree() const{
    return m_tree;
}

const QList<QObject *> Model::treeAsQObjects() const{
    QList<QObject *> res;
    res.reserve(m_tree.count());
    for(auto i : m_tree)
        res.append(i);
    return res;
}

int Model::count() const
{
    return m_tree.count();
}
