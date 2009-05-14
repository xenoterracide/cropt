#include <QtGui>
#include <QtSql>

#include "connection.h"

void initializeModel(QSqlRelationalTableModel *model)
{
	model->setTable("consumer.consumers");

	model->setEditStrategy(QSqlTableModel::OnManualSubmit);
	model->setRelation(0, QSqlRelation("consumer.phones", "id", "phone"));

	model->setHeaderData(0, Qt::Horizontal, QObject::tr("ID"));
	model->setHeaderData(2, Qt::Horizontal, QObject::tr("First Name"));
	model->setHeaderData(1, Qt::Horizontal, QObject::tr("Last Name"));
	model->setHeaderData(4, Qt::Horizontal, QObject::tr("Phone"));

	model->select();
}

QTableView *createView(const QString &title, QSqlTableModel *model)
{
	QTableView *view = new QTableView;
	view->setModel(model);
	view->setItemDelegate(new QSqlRelationalDelegate(view));
	view->setWindowTitle(title);
	return view;
}

int main(int argc, char *argv[])
{
	QApplication app(argc, argv);
	if (!createConnection())
	    return 1;

	QSqlRelationalTableModel model;

	initializeModel(&model);

	QTableView *view = createView(QObject::tr("Relational Table Model"), &model);
	view->show();

	return app.exec();
}
