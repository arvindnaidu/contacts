class CreateContactReminders < ActiveRecord::Migration
  def up
    execute <<-EOSQL
        CREATE TABLE contact_reminders (
          id bigint(11) NOT NULL AUTO_INCREMENT,
          contact_id bigint(11) NOT NULL,
          content varchar(200) NOT NULL,
          color varchar(20),
          time TIMESTAMP,
          created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
          updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
          PRIMARY KEY (id)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
    EOSQL
  end

  def down
    execute <<-EOSQL
      DROP TABLE contact_reminders
    EOSQL
  end
end
