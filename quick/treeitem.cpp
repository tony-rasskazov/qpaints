#include "treeitem.h"

TreeItem* TreeItem::s_selected = 0;

TreeItem::TreeItem(const QString &content, const QColor &color, TreeItem *parent, bool isOpen) :
    QObject(parent),
    m_parentItem(parent),
    m_content(content),
    m_color(color),
    m_selected(false),
    m_level(0),
    m_childItems(QList<TreeItem*>()),
    m_isOpen(isOpen)
{
    if (parent) {
        parent->addChildItem(this);
        setLevel(parent->level() + 1);
    }
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

QColor TreeItem::color() const
{
    return m_color;
}

void TreeItem::setColor(const QColor &color)
{
    if (color != m_color){
        m_color = color;
        emit colorChanged();
    }

}

bool TreeItem::selected() const
{
    return m_selected;
}

void TreeItem::setSelected(bool selected)
{
    if (selected != m_selected) {
        m_selected = selected;
        if (s_selected) {
            s_selected->setSelected(false);
        }
        s_selected = this;
        emit selectedChanged();
    }

}

int TreeItem::level() const
{
    return m_level;
}

void TreeItem::setLevel(int level)
{
    if(level != m_level){
        m_level = level;
        emit levelChanged();
    }

}

int TreeItem::childCount() const
{
    return m_childItems.count();
}

//! index in parent.m_childItems
int TreeItem::index() const
{
    if (!m_parentItem)
        return -1;
    else {
        TreeItem *p = m_parentItem;

        int inx = p->m_childItems.indexOf(const_cast<TreeItem*>(this));

        return inx;
    }
}

QColor TreeItem::levelColor() const
{
    return m_levelColor;
}

void TreeItem::setLevelColor(QColor levelColor)
{
    if(levelColor != m_levelColor){
        m_levelColor = levelColor;
        emit levelColorChanged();
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
    return m_childItems.count() == 0 ? true : m_isOpen;
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
