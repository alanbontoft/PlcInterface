#include "datalist.h"

DataList::DataList(QObject *parent) : QObject(parent)
{

}

void DataList::setSize(int size)
{
    DataModel *model;

    _dataList.clear();

    for (int i=0; i < size; i++)
    {
        model = new DataModel();

        model->setSalary(10000 * (i + 1));

        add(model);
    }
}
