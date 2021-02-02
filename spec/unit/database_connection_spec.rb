require 'database_connection'

describe DatabaseConnection do

  describe '.setup' do
    it 'connects to a database' do
      expect(PG).to receive(:connect).with(dbname: 'xtreme_bnb_test')
      DatabaseConnection.setup('xtreme_bnb_test')
    end
  end

  describe '.query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup('xtreme_bnb_test')
      expect(connection).to receive(:exec).with('SELECT * FROM users;')
      DatabaseConnection.query('SELECT * FROM users;')
    end
  end

end
