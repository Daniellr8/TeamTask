using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TeamTask.Infrastructure.Interfaces.DataAccess
{
    public interface IDapperDataAccess
    {
        IDbConnection CreateConnection();

        List<T> GetAll<T>(string queryString, int timeOut = 60, CommandType commandType = CommandType.Text);
        Task<List<T>> GetAllAsync<T>(string queryString, object? parms = null, int timeOut = 60, CommandType commandType = CommandType.Text);
        Task<int> ExecuteAsync(string sp, object? parms = null, int timeOut = 60, CommandType commandType = CommandType.StoredProcedure);
    }
}
