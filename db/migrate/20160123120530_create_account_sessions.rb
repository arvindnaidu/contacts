class CreateAccountSessions < ActiveRecord::Migration
  def up
    execute <<-EOSQL
        CREATE TABLE account_sessions (
          id bigint(11) NOT NULL AUTO_INCREMENT,
          session_id varchar(70) NOT NULL,
          account_id bigint(11) NOT NULL,
          authenticity_token varchar(70) NOT NULL,
          created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
          updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
          PRIMARY KEY (id),
          UNIQUE KEY unique_session_id (session_id)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
    EOSQL
  end

  def down
    execute <<-EOSQL
      DROP TABLE account_sessions
    EOSQL
  end
end
