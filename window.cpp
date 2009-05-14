#include <QtGui>
#include <QtSql>

#include "window.h"

Window::Window(QWidget *parent)
	: QWidget(parent)
{
	setupModel();

	nameLabel = new QLabel(tr("Na&me:"));
	nameEdit = new QLineEdit();
	addressLabel = new QLabel(tr("&Address:"));
	addressEdit = new QTextEdit();
	typeLabel = new QLabel(tr("&Type:"));
	typeComboBox = new QComboBox();
	nextButton = new QPushButton(tr("&Next"));
	previousButton = new QPushButton(tr("&Previous"));

	nameLabel->setBuddy(nameEdit);
	addressLabel->setBuddy(addressEdit);
	typeLabel->setBuddy(typeComboBox);

	QSqlTableModel *relModel = model->relationModel(typeIndex);
	typeComboBox->setModel(relModel);
	typeComboBox->setModelColumn(relModel->fieldIndex("description"));

	mapper = new QDataWidgetMapper(this);
	mapper->setModel(model);
	mapper->setItemDelegate(new QSqlRelationalDelegate(this));
	mapper->addMapping(nameEdit, model->fieldIndex("name"));
	mapper->addMapping(addressEdit, model->fieldIndex("address"));
	mapper->addMapping(typeComboBox, typeIndex);

	connect(previousButton, SIGNAL(clicked()),
	        mapper, SLOT(toPrevious()));
	connect(nextButton, SIGNAL(clicked()),
	        mapper, SLOT(toNext()));
	connect(mapper, SIGNAL(currentIndexChanged(int)),
	        this, SLOT(updateButtons(int)));

	QGridLayout *layout = new QGridLayout();
	layout->addWidget(nameLabel, 0, 0, 1, 1);
	layout->addWidget(nameEdit, 0, 1, 1, 1);
	layout->addWidget(previousButton, 0, 2, 1, 1);
	layout->addWidget(addressLabel, 1, 0, 1, 1);
	layout->addWidget(addressEdit, 1, 1, 2, 1);
	layout->addWidget(nextButton, 1, 2, 1, 1);
	layout->addWidget(typeLabel, 3, 0, 1, 1);
	layout->addWidget(typeComboBox, 3, 1, 1, 1);
	setLayout(layout);

	setWindowTitle(tr("SQL Widget Mapper"));
	mapper->toFirst();
}

void Window::updateButtons(int row)
{
	previousButton->setEnabled(row > 0);
	nextButton->setEnabled(row < model->rowCount() - 1);
}

