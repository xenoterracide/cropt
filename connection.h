#ifndef CONNECTION_H
#define CONNECTION_H

#include <QMessageBox>
#include <QSqlDatabase>
#include <QSqlError>
static bool createConnection()
{
	QSqlDatabase db = QSqlDatabase::addDatabase("QPSQL");
	db.setDatabaseName("xenoterracide");
	db.setHostName("localhost");
	db.setUserName("xenoterracide");
	db.setPassword("xenoterracide");

	if (!db.open()) {
		QMessageBox::critical(0, qApp->tr("Cannot open database"),
			qApp->tr("Unable to establish a database connection.\n"
					 "This example needs PostgreSQL support. Please read "
					 "the Qt SQL driver documentation for information how "
					 "to build it.\n\n"
					 "Click Cancel to exit."), QMessageBox::Cancel);
		return false;
	}
	return true;
}
#endif // CONNECTION_H
