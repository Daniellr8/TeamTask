using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TeamTask.Infrastructure.SqlStatement.Developers
{
    public class sqlStatementDevelopers
    {
        public static string GetAllDevelopers() 
            => """SELECT DeveloperId, FirstName, LastName, Email  FROM Developers where IsActive = 1""";
        
    }
}
