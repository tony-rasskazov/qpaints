#include "model.h"
#include "treeitem.h"

const int number = 100;

TreeItem *createTreeItem(const QString &title){
    auto res = new TreeItem(title);
    while(qrand() % 2) {
        res->addChildItem(createTreeItem(QString::number(qrand() % number)));
    }
    return res;
}

Model::Model(QObject *parent) :
    QObject(parent),
    m_tree(QList<TreeItem*>())
{
    m_tree.append(createTreeItem("Root1"));
    m_tree.append(createTreeItem("Root2"));
    m_tree.append(createTreeItem("Root3"));
    m_tree.append(createTreeItem("Root4"));
    m_tree.append(createTreeItem("Root5"));
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
