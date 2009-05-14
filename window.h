#ifndef WINDOW_H
#define WINDOW_H

#include <QWidget>

class QComboBox;
class QDataWidgetMapper;
class QItemSelectionModel;
class QLabel;
class QLineEdit;
class QPushButton;
class QSqlRelationalTableModel;
class QStandardItemModel;
class QStringListModel;
class QTextEdit;

class Window : public QWidget
{
	Q_OBJECT

public:
	Window(QWidget *parent = 0);

private slots:
	void updateButtons(int row);

private:
	void setupModel();

	QLabel *nameLabel;
	QLabel *addressLabel;
	QLabel *typeLabel;
	QLineEdit *nameEdit;
	QTextEdit *addressEdit;
	QComboBox *typeComboBox;
	QPushButton *nextButton;
	QPushButton *previousButton;

	QSqlRelationalTableModel *model;
	QItemSelectionModel *selectionModel;
	QDataWidgetMapper *mapper;
	int typeIndex;
};

#endif
