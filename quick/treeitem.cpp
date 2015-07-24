#include "treeitem.h"

TreeItem::TreeItem(const QString &content, const QColor &color, QObject *parent) :
    QObject(parent),
    m_content(content),
    m_color(color),
    m_childItems(QList<TreeItem*>()),
    m_isOpen(true)
{
}

const QString &TreeItem::content() const{
    return m_content;
}

void TreeItem::setContent(const QString &content){
    if(content != m_content){
        m_content = content;
        emit contentChanged();
    }
}

const QColor &TreeItem::color() const
{
    return m_color;
}

void TreeItem::setColor(const QColor &color)
{
    if(color != m_color){
        m_color = color;
        emit colorChanged();
    }

}

const QList<TreeItem *> &TreeItem::childItems() const{
    return m_childItems;
}

const QList<QObject *> TreeItem::childItemsAsQObject() const{
    QList<QObject *> res;
    res.reserve(m_childItems.count());
    for(auto i : m_childItems)
        res.append(i);
    return res;
}

void TreeItem::addChildItem(TreeItem *childItem){
    m_childItems.append(childItem);
    emit childItemsChanged();
    if(m_childItems.count() == 1)
        emit hasChildChanged();
}

bool TreeItem::isOpen() const{
    return m_isOpen;
}

void TreeItem::setIsOpen(bool isOpen){
    if(isOpen != m_isOpen){
        m_isOpen = isOpen;
        emit isOpenChanged();
    }
}

bool TreeItem::hasChild() const{
    return !m_childItems.isEmpty();
}
