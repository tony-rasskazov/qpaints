#include "model.h"
#include "treeitem.h"

#include <QColor>

const int number = 100;

TreeItem *createTreeItem(const QString &title){
    auto res = new TreeItem(title, QColor(Qt::gray));
    return res;
}

Model::Model(QObject *parent) :
    QObject(parent),
    m_tree(QList<TreeItem*>())
{
    auto factory1 = createTreeItem("Завод");

    auto plant1 = createTreeItem("Цех №1");
    auto c11 = createTreeItem("Компрессор");

    auto p1 = createTreeItem("Подшипник №1");
    p1->addChildItem(createTreeItem("x"));
    p1->addChildItem(createTreeItem("y"));
    p1->addChildItem(createTreeItem("z"));
    c11->addChildItem(p1);

    auto t11 = createTreeItem("Турбина");
    auto n11 = createTreeItem("Нагнетатель");
    auto d11 = createTreeItem("Диагностика");

    plant1->addChildItem(c11);
    plant1->addChildItem(t11);
    plant1->addChildItem(n11);
    plant1->addChildItem(d11);

    factory1->addChildItem(plant1);

    auto plant2 = createTreeItem("Цех №2");
    auto c12 = createTreeItem("Компрессор");
    auto t12 = createTreeItem("Турбина");
    auto n12 = createTreeItem("Нагнетатель");
    auto d12 = createTreeItem("Диагностика");

    plant2->addChildItem(c12);
    plant2->addChildItem(t12);
    plant2->addChildItem(n12);
    plant2->addChildItem(d12);

    factory1->addChildItem(plant2);
    m_tree.append(factory1);

    auto factory2 = createTreeItem("Завод");

    plant1 = createTreeItem("Цех №1");
    c11 = createTreeItem("Компрессор");

    p1 = createTreeItem("Подшипник №1");
    p1->addChildItem(createTreeItem("x"));
    p1->addChildItem(createTreeItem("y"));
    p1->addChildItem(createTreeItem("z"));
    c11->addChildItem(p1);

    t11 = createTreeItem("Турбина");
    n11 = createTreeItem("Нагнетатель");
    d11 = createTreeItem("Диагностика");

    plant1->addChildItem(c11);
    plant1->addChildItem(t11);
    plant1->addChildItem(n11);
    plant1->addChildItem(d11);

    factory2->addChildItem(plant1);

    plant2 = createTreeItem("Цех №2");
    c12 = createTreeItem("Компрессор");
    t12 = createTreeItem("Турбина");
    n12 = createTreeItem("Нагнетатель");
    d12 = createTreeItem("Диагностика");

    plant2->addChildItem(c12);
    plant2->addChildItem(t12);
    plant2->addChildItem(n12);
    plant2->addChildItem(d12);

    factory2->addChildItem(plant2);
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
