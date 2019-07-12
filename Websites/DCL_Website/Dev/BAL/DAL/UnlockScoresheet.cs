using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Cricket.DAL;

namespace BAL.DAL
{
    public class GetUnlockList : Command
    {
        public GetUnlockList(Connection conn) : base(conn)
        {
            m_cmd.CommandText = "select id, match_id, is_active ,team_requesting from unlock_scoresheet order by  is_active desc, created_date desc";
        }
    }

    public class GetActiveUnlockList : Command
    {
        public GetActiveUnlockList(Connection conn) : base(conn)
        {
            m_cmd.CommandText = "select id, match_id, is_active ,team_requesting from unlock_scoresheet  where is_active = 1 order by  is_active desc, created_date desc";
        }
    }
    public class GetUnlockData : Command
    {
        public GetUnlockData(Connection conn) : base(conn)
        {
            m_cmd.CommandText = "select * from unlock_scoresheet where id = @id ";
            addParmInt("id");
        }
    }
    public class CreateUnlockScoresheet : Command
    {
        public CreateUnlockScoresheet(Connection conn) : base(conn)
        {
            m_cmd.CommandText = "insert into unlock_scoresheet ([match_id],[is_active],[created_date],[modified_date],[team_requesting]) " +
                                "values (@match_id, @is_active, GetDate(), GetDate(), @team_requesting) ";
            addParmInt("match_id");
            addParmInt("is_active");
            addParmText("team_requesting");
        }
    }

    public class SetUnlockScoresheet : Command
    {
        public SetUnlockScoresheet(Connection conn) : base(conn)
        {
            m_cmd.CommandText = "update unlock_scoresheet set " +
                                "match_id = @match_id, is_active = @is_active, modified_date = GetDate(), team_requesting = @team_requesting " +
                                "where id = @id ";
            addParmInt("match_id");
            addParmInt("is_active");
            addParmText("team_requesting");
            addParmInt("id");
        }
    }
}
