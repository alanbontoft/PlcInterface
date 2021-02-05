#ifndef DATALIST_H
#define DATALIST_H

#include <QObject>
#include <QVariantList>
#include "datamodel.h"


class DataList : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QVariantList data READ data)
    Q_PROPERTY(int size READ size WRITE setSize)

    // Q_INVOKABLE

public:
    explicit DataList(QObject *parent = nullptr);

    QVariantList data() { return _dataList; }

    int size() { return _dataList.count(); }

    void setSize(int size);

    void add(DataModel* model) { _dataList.append(QVariant::fromValue(model)); }

signals:

private:
    QVariantList _dataList;

};

#endif // DATALIST_H
