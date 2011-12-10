databaseChangeLog = {

	changeSet(author: "jmbe (generated)", id: "1323539606973-1") {
		createTable(tableName: "account") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "accountPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "description", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "email", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "email_show", type: "bit") {
				constraints(nullable: "false")
			}

			column(name: "enabled", type: "bit") {
				constraints(nullable: "false")
			}

			column(name: "passwd", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "user_real_name", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "username", type: "varchar(255)") {
				constraints(nullable: "false", unique: "true")
			}
		}
	}

	changeSet(author: "jmbe (generated)", id: "1323539606973-2") {
		createTable(tableName: "bulletin") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "bulletinPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "cover_page", type: "mediumblob") {
				constraints(nullable: "false")
			}

			column(name: "data", type: "mediumblob") {
				constraints(nullable: "false")
			}

			column(name: "date_created", type: "datetime")

			column(name: "description", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "n_downloads", type: "integer") {
				constraints(nullable: "false")
			}

			column(name: "name", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "title", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "visible", type: "bit") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "jmbe (generated)", id: "1323539606973-3") {
		createTable(tableName: "bulletin_opf") {
			column(name: "bulletin_opfs_id", type: "bigint")

			column(name: "opf_id", type: "bigint")

			column(name: "opfs_idx", type: "integer")
		}
	}

	changeSet(author: "jmbe (generated)", id: "1323539606973-4") {
		createTable(tableName: "opf") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "opfPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "title", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "url", type: "varchar(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "jmbe (generated)", id: "1323539606973-5") {
		createTable(tableName: "role") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "rolePK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "authority", type: "varchar(255)") {
				constraints(nullable: "false", unique: "true")
			}

			column(name: "description", type: "varchar(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "jmbe (generated)", id: "1323539606973-6") {
		createTable(tableName: "role_people") {
			column(name: "role_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "account_id", type: "bigint") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "jmbe (generated)", id: "1323539606973-7") {
		addPrimaryKey(columnNames: "role_id, account_id", tableName: "role_people")
	}

	changeSet(author: "jmbe (generated)", id: "1323539606973-8") {
		createIndex(indexName: "username_unique_1323539606921", tableName: "account", unique: "true") {
			column(name: "username")
		}
	}

	changeSet(author: "jmbe (generated)", id: "1323539606973-9") {
		createIndex(indexName: "FK47F2EC0DC3C53B7A", tableName: "bulletin_opf") {
			column(name: "opf_id")
		}
	}

	changeSet(author: "jmbe (generated)", id: "1323539606973-10") {
		createIndex(indexName: "authority_unique_1323539606943", tableName: "role", unique: "true") {
			column(name: "authority")
		}
	}

	changeSet(author: "jmbe (generated)", id: "1323539606973-11") {
		createIndex(indexName: "FK28B75E7852388A1A", tableName: "role_people") {
			column(name: "role_id")
		}
	}

	changeSet(author: "jmbe (generated)", id: "1323539606973-12") {
		createIndex(indexName: "FK28B75E78ED2A3E7A", tableName: "role_people") {
			column(name: "account_id")
		}
	}

	changeSet(author: "jmbe (generated)", id: "1323539606973-13") {
		addForeignKeyConstraint(baseColumnNames: "opf_id", baseTableName: "bulletin_opf", constraintName: "FK47F2EC0DC3C53B7A", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "opf", referencesUniqueColumn: "false")
	}

	changeSet(author: "jmbe (generated)", id: "1323539606973-14") {
		addForeignKeyConstraint(baseColumnNames: "account_id", baseTableName: "role_people", constraintName: "FK28B75E78ED2A3E7A", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "account", referencesUniqueColumn: "false")
	}

	changeSet(author: "jmbe (generated)", id: "1323539606973-15") {
		addForeignKeyConstraint(baseColumnNames: "role_id", baseTableName: "role_people", constraintName: "FK28B75E7852388A1A", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "role", referencesUniqueColumn: "false")
	}
}
