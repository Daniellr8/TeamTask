using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System.Data;
using TeamTask.Infrastructure.Interfaces.DataAccess;

namespace TeamTask.Infrastructure.Data.DapperDataAccess
{
    public class DapperDataAccess : IDapperDataAccess
    {
        private readonly string _connectionString;
        public DapperDataAccess(IConfiguration config)
        {
            _connectionString = config.GetConnectionString("DefaultConnection");
        }
        public IDbConnection CreateConnection() => new SqlConnection(_connectionString);

        public List<T> GetAll<T>(string queryString, int timeOut = 60, CommandType commandType = CommandType.Text)
        {
            using IDbConnection db = CreateConnection();
            return db.Query<T>(queryString, commandType: commandType, commandTimeout: timeOut).ToList();
        }

        public async Task<List<T>> GetAllAsync<T>(string queryString, object? parms = null, int timeOut = 60, CommandType commandType = CommandType.Text)
        {
            using var connection = CreateConnection();
            var result = await connection.QueryAsync<T>(queryString, parms, commandType: commandType, commandTimeout: timeOut);
            return result.ToList();
        }

        public async Task<int> ExecuteAsync(string sp, object? parms = null, int timeOut = 60, CommandType commandType = CommandType.StoredProcedure)
        {
            using var connection = CreateConnection();
            return await connection.ExecuteAsync(sp, parms, commandType: commandType, commandTimeout: timeOut);
        }

    }
}
