class CreateContacts < ActiveRecord::Migration
  def up
    execute <<-EOSQL
        CREATE TABLE contacts (
          id bigint(11) NOT NULL AUTO_INCREMENT,
          account_id bigint(11) NOT NULL,
          name varchar(100) NOT NULL,
          email varchar(100),
          mobile varchar(100),
          dob varchar(30),
          gender tinyint(1),
          city varchar(50),
          state varchar(50),
          country varchar(50),
          zip varchar(20),
          deleted tinyint(1) DEFAULT 0,
          created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
          updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
          PRIMARY KEY (id)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
    EOSQL
  end

  def down
    execute <<-EOSQL
      DROP TABLE contacts
    EOSQL
  end
end
