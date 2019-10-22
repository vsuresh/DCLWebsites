using System;
using System.Collections;
using System.Data.SqlClient;
using BAL.DAL;
using Cricket.DAL;
using Cricket.DAL.Address;
using Cricket.DAL.Matches;
using Cricket.DAL.Penalty;
using Cricket.DAL.Players;
using Cricket.DAL.Team;
using Cricket.DAL.TeamRegistration;
using Cricket.DAL.Tournament;
using Cricket.DAL.Users;

namespace Cricket.BAL
{
    /// <summary>
    /// Summary description for Class1.
    /// </summary>


    public class Base : Object
    {
        //Helper methods
        protected int toInt(Object strDataObject)
        {
            if (strDataObject != null)
            {
                string strData = strDataObject.ToString();
                if (strData != null)
                    if (strData.Length > 0)
                        return int.Parse(strData);
            }
            return 0;
        }

        protected float toFloat(Object strDataObject)
        {
            if (strDataObject != null)
            {
                string strData = strDataObject.ToString();
                if (strData != null)
                    if (strData.Length > 0)
                        return float.Parse(strData);
            }
            return 0;
        }
    }

    public class BusinessLayerBase : Base
    {
        protected Connection m_conn;

        public BusinessLayerBase()
        {
        }

        public void open()
        {
            m_conn = new Connection();
            m_conn.open();
        }

        public void close()
        {
            if (m_conn != null)
                m_conn.close();
        }

    }

    public class Data
    {
        protected Connection m_conn;

        public Data(Connection conn)
        {
            m_conn = conn;
        }

    }

    public class BusinessLayer : BusinessLayerBase
    {
        private DataStatistics dataStats = null;

        public SqlConnection GetSQLConnection()
        {
            return m_conn.getConnection();
        }

        public DataStatistics DataStatistics
        {
            get
            {
                if (dataStats == null)
                    dataStats = new DataStatistics(m_conn);
                return dataStats;
            }
        }

        public int getRandomNumber()
        {
            Random r = new Random((int)DateTime.Now.Ticks);
            return r.Next();
        }

        public int newEmailId()
        {
            int nNewId = 0;
            SqlDataReader dr;
            bool fUnique = false;
            CheckEmailId cmd = new CheckEmailId(m_conn);
            while (!fUnique)
            {
                nNewId = getRandomNumber();
                cmd.setParm("email_id", nNewId.ToString());
                dr = cmd.executeReader();
                if (dr.Read())
                    fUnique = false;
                else
                    fUnique = true;
                dr.Close();
            }
            return nNewId;
        }
        public int newPhoneId()
        {
            int nNewId = 0;
            SqlDataReader dr;
            bool fUnique = false;
            CheckPhoneId cmd = new CheckPhoneId(m_conn);
            while (!fUnique)
            {
                nNewId = getRandomNumber();
                cmd.setParm("phone_id", nNewId.ToString());
                dr = cmd.executeReader();
                if (dr.Read())
                    fUnique = false;
                else
                    fUnique = true;
                dr.Close();
            }
            return nNewId;
        }

        public int newAddressId()
        {
            int nNewId = 0;
            SqlDataReader dr;
            bool fUnique = false;
            CheckAddressId cmd = new CheckAddressId(m_conn);
            while (!fUnique)
            {
                nNewId = getRandomNumber();
                cmd.setParm("address_id", nNewId.ToString());
                dr = cmd.executeReader();
                if (dr.Read())
                    fUnique = false;
                else
                    fUnique = true;
                dr.Close();
            }
            return nNewId;
        }

        public int newTeamId()
        {
            int nNewId = 0;
            SqlDataReader dr;
            bool fUnique = false;
            CheckTeamId cmd = new CheckTeamId(m_conn);
            while (!fUnique)
            {
                nNewId = getRandomNumber();
                cmd.setParm("team_id", nNewId.ToString());
                dr = cmd.executeReader();
                if (dr.Read())
                    fUnique = false;
                else
                    fUnique = true;
                dr.Close();
            }
            return nNewId;
        }

        public int newTournamentId()
        {
            GetNewTournamentId cmd = new GetNewTournamentId(m_conn);
            return (int)cmd.executeScalar();
        }


        public int newMatchId()
        {
            int nNewId = 0;
            SqlDataReader dr;
            bool fUnique = false;
            CheckMatchId cmd = new CheckMatchId(m_conn);
            while (!fUnique)
            {
                nNewId = getRandomNumber();
                cmd.setParm("match_id", nNewId.ToString());
                dr = cmd.executeReader();
                if (dr.Read())
                    fUnique = false;
                else
                    fUnique = true;
                dr.Close();
            }
            return nNewId;
        }

        public int newPlayerId()
        {
            int nNewId = 0;
            SqlDataReader dr;
            bool fUnique = false;
            CheckPlayerId cmd = new CheckPlayerId(m_conn);
            while (!fUnique)
            {
                nNewId = getRandomNumber();
                cmd.setParm("player_id", nNewId.ToString());
                dr = cmd.executeReader();
                if (dr.Read())
                    fUnique = false;
                else
                    fUnique = true;
                dr.Close();
            }
            return nNewId;
        }

        public SqlDataReader loginUser(string strUserName, string strPassword)
        {
            LoginUser login = new LoginUser(m_conn);
            login.setParm("user_name", strUserName);
            login.setParm("password", strPassword);
            return login.executeReader();
        }

        public bool changePassword(int nUserId, string strOldPwd, string strNewPwd)
        {
            GetUserById cmd = new GetUserById(m_conn);
            cmd.setParm("user_id", nUserId);
            SqlDataReader dr = cmd.executeReader();

            string strOldDBPwd = "";
            if (dr.Read())
            {
                if (!dr.IsDBNull(dr.GetOrdinal("password")))
                    strOldDBPwd = (string)dr["password"];
            }
            dr.Close();

            if (strOldDBPwd.ToUpper() != strOldPwd.ToUpper())
                return false;

            ChangePassword cmd2 = new ChangePassword(m_conn);
            cmd2.setParm("user_id", nUserId);
            cmd2.setParm("password", strNewPwd);
            cmd2.executeNonQuery();
            return true;
        }

        public int createEmail(string strEmail)
        {
            int nEmailId = newEmailId();
            CreateEmail cmd = new CreateEmail(m_conn);
            cmd.setParm("email_id", nEmailId);
            cmd.setParm("email_code", "PRIMARY");
            cmd.setParm("address", strEmail);
            cmd.executeNonQuery();
            return nEmailId;
        }

        public void setEmail(int nEmailId, string strEmail)
        {
            SetEmail cmd = new SetEmail(m_conn);
            cmd.setParm("email_id", nEmailId);
            cmd.setParm("email_code", "PRIMARY");
            cmd.setParm("address", strEmail);
            cmd.executeNonQuery();
        }

        public int createPhone(string strPhone)
        {
            int nPhoneId = newPhoneId();
            CreatePhone cmd = new CreatePhone(m_conn);
            cmd.setParm("phone_id", nPhoneId);
            cmd.setParm("phone_code", "PRIMARY");
            cmd.setParm("number", strPhone);
            cmd.executeNonQuery();
            return nPhoneId;
        }

        public void setPhone(int nPhoneId, string strPhone)
        {
            SetPhone cmd = new SetPhone(m_conn);
            cmd.setParm("phone_id", nPhoneId);
            cmd.setParm("phone_code", "PRIMARY");
            cmd.setParm("number", strPhone);
            cmd.executeNonQuery();
        }

        public int createAddress(string strStreet1, string strStreet2, string strCity, string strState, string strZip, string strCountry)
        {
            int nAddressId = newAddressId();
            CreateAddress cmd = new CreateAddress(m_conn);
            cmd.setParm("address_id", nAddressId);
            cmd.setParm("address_code", "PRIMARY");
            cmd.setParm("street1", strStreet1);
            cmd.setParm("street2", strStreet2);
            cmd.setParm("city", strCity);
            cmd.setParm("state", strState);
            cmd.setParm("zip", strZip);
            cmd.setParm("country", strCountry);
            cmd.executeNonQuery();
            return nAddressId;
        }

        public void setAddress(int nAddressId, string strStreet1, string strStreet2, string strCity, string strState, string strZip, string strCountry)
        {
            SetAddress cmd = new SetAddress(m_conn);
            cmd.setParm("address_id", nAddressId);
            cmd.setParm("address_code", "PRIMARY");
            cmd.setParm("street1", strStreet1);
            cmd.setParm("street2", strStreet2);
            cmd.setParm("city", strCity);
            cmd.setParm("state", strState);
            cmd.setParm("zip", strZip);
            cmd.setParm("country", strCountry);
            cmd.executeNonQuery();
        }

        public SqlDataReader getTeamData(int nTeamId)
        {
            GetTeamData cmd = new GetTeamData(m_conn);
            cmd.setParm("team_id", nTeamId);
            return cmd.executeReader();
        }

        public void setTeamData(int nTeamId, string strName, string strDesc, string strContactName, string emailAddress, string strGroundName, int activeSw)
        {
            SetTeamData cmd = new SetTeamData(m_conn);
            cmd.setParm("team_id", nTeamId);
            cmd.setParm("name", strName);
            cmd.setParm("description", strDesc);
            cmd.setParm("contact_name", strContactName);
            cmd.setParm("contact_email", emailAddress);
            cmd.setParm("ground_name", strGroundName);
            cmd.setParm("active_sw", activeSw);
            cmd.executeNonQuery();

        }


        public bool checkTeamName(string strName)
        {
            bool fFound = false;
            CheckTeamName cmd = new CheckTeamName(m_conn);
            cmd.setParm("name", strName);
            SqlDataReader dr = cmd.executeReader();
            if (dr.Read())
                fFound = true;
            dr.Close();
            return fFound;
        }

        public void createTeamData(string strName, string userName, string strDesc, string strContactName, string emailAddress, string strGroundName, int activeSw)
        {
            int nTeamId = newTeamId();

            if (checkTeamName(strName))
                throw new Exception("Team name already exists!");

            CreateTeamData cmd = new CreateTeamData(m_conn);
            cmd.setParm("team_id", nTeamId);
            cmd.setParm("name", strName);
            cmd.setParm("description", strDesc);
            cmd.setParm("contact_name", strContactName);
            cmd.setParm("contact_email", emailAddress);
            cmd.setParm("ground_name", strGroundName);

            cmd.setParm("address_id", createAddress("", "", "", "", "", ""));
            cmd.setParm("phone_id", createPhone(""));
            cmd.setParm("email_id", createEmail(""));
            cmd.setParm("active_sw", activeSw);
            cmd.executeNonQuery();

            int userId = 0;
            using (SqlCommand cmd1 = new SqlCommand("select MAX(user_id)+1 from users ", GetSQLConnection()))
            {
                cmd1.CommandType = System.Data.CommandType.Text;
                userId = int.Parse(cmd1.ExecuteScalar().ToString());
            }


            using (SqlCommand com = new SqlCommand(
                  string.Format("insert into users (user_id, user_name, password, reminder, created_dt, mod_dt, team_id, user_type) " +
                                "values ({0}, '{1}', '{2}', '{3}', GetDate(), GetDate(), {4}, 1) ", +
                                userId, userName, userName, strName, nTeamId), GetSQLConnection()))
            {
                com.CommandType = System.Data.CommandType.Text;
                com.ExecuteNonQuery();
            }

        }


        public void addTournamentTeam(int nId, int nTeamId)
        {
            GetNewTournamentTeamRecId cmd2 = new GetNewTournamentTeamRecId(m_conn);
            cmd2.setParm("tournament_id", nId);
            int nRecId = (int)cmd2.executeScalar();

            CheckTournamentTeam cmd3 = new CheckTournamentTeam(m_conn);
            cmd3.setParm("tournament_id", nId);
            cmd3.setParm("team_id", nTeamId);
            object status = cmd3.executeScalar();
            if (status == null)
            {
                AddTournamentTeam cmd = new AddTournamentTeam(m_conn);
                cmd.setParm("tournament_id", nId);
                cmd.setParm("rec_id", nRecId);
                cmd.setParm("team_id", nTeamId);
                cmd.setParm("active_sw", 1);
                cmd.executeNonQuery();
            }
        }

        public void createTournament(string strName, string strDesc, string strStartDate, string strEndDate, int overs, int fees, string regstartdate, string regenddate, string groupName, string regInfo, string format)
        {
            int nId = newTournamentId();

            CreateTournament cmd = new CreateTournament(m_conn);
            cmd.setParm("tournament_id", nId);
            cmd.setParm("name", strName);
            cmd.setParm("description", strDesc);
            cmd.setParm("start_dt", strStartDate);
            cmd.setParm("end_dt", strEndDate);
            cmd.setParm("overs", overs);
            cmd.setParm("fees", fees);
            cmd.setParm("regstart_dt", regstartdate);
            cmd.setParm("regend_dt", regenddate);
            cmd.setParm("group_name", groupName);
            cmd.setParm("registration_info", regInfo);
            cmd.setParm("format", format);
            cmd.executeNonQuery();
        }

        public void createTeamRegistration(Guid RegistrationID, int nTournamentId, string strTeamName, string strLocation,
            string contact1Name, string contact1Title, string contact1Phone, string contact1Email,
            string contact2Name, string contact2Title, string contact2Phone, string contact2Email,
            string strComments, string orderID)
        {
            if (nTournamentId > 0)
            {
                GetNewTeamRegistrationRecId cmd2 = new GetNewTeamRegistrationRecId(m_conn);
                cmd2.setParm("tournament_id", nTournamentId);
                int nRecId = (int)cmd2.executeScalar();


                CreateTeamRegistration cmd = new CreateTeamRegistration(m_conn);
                cmd.setParm("RegistrationID", RegistrationID);
                cmd.setParm("tournament_id", nTournamentId);
                cmd.setParm("rec_id", nRecId);
                cmd.setParm("team_id", 0);
                cmd.setParm("name", strTeamName);
                cmd.setParm("location", strLocation);
                cmd.setParm("contact1_name", contact1Name);
                cmd.setParm("contact1_title", contact1Title);
                cmd.setParm("contact1_phone", contact1Phone);
                cmd.setParm("contact1_email", contact1Email);
                cmd.setParm("contact2_name", contact2Name);
                cmd.setParm("contact2_title", contact2Title);
                cmd.setParm("contact2_phone", contact2Phone);
                cmd.setParm("contact2_email", contact2Email);
                cmd.setParm("comments", strComments);
                cmd.setParm("order_id", orderID);
                cmd.executeNonQuery();
            }
        }

        public void CreatePayPalRegistrationTemp(Guid RegistrationID, String TeamName, String Location, String ContactName)
        {
            CreatePayPalRegistration cmd = new CreatePayPalRegistration(m_conn);
            cmd.setParm("RegistrationID", RegistrationID);
            cmd.setParm("TeamName", TeamName);
            cmd.setParm("Location", Location);
            cmd.setParm("ContactName", ContactName);
            cmd.executeNonQuery();
        }

        public void AddPaymentDetails(Guid RegistrationID, string OrderId, string Amount, string PaymentStatus, DateTime PaymentDate)
        {
            AddPaymentDetails objPayment = new AddPaymentDetails(m_conn);
            objPayment.setParm("@RegistrationID", RegistrationID);
            objPayment.setParm("@OrderId", OrderId);
            objPayment.setParm("@Amount", Amount);
            objPayment.setParm("@PaymentStatus", PaymentStatus);
            objPayment.setParm("@PaymentDate", PaymentDate);
            objPayment.executeNonQuery();
        }


        public void setTournamentData(int nId, string strName, string strDesc, string strStartDate, string strEndDate, int overs, int fees, string regstartdate, string regenddate, string groupName, string regInfo, string format)
        {
            SetTournamentData cmd = new SetTournamentData(m_conn);
            cmd.setParm("tournament_id", nId);
            cmd.setParm("name", strName);
            cmd.setParm("description", strDesc);
            cmd.setParm("start_dt", strStartDate);
            cmd.setParm("end_dt", strEndDate);
            cmd.setParm("overs", overs);
            cmd.setParm("fees", fees);
            cmd.setParm("regstart_dt", regstartdate);
            cmd.setParm("regend_dt", regenddate);
            cmd.setParm("group_name", groupName);
            cmd.setParm("registration_info", regInfo);
            cmd.setParm("format", format);
            cmd.executeNonQuery();
        }
        public void setUnlockScoresheet(int match_id, bool is_active, string team_requesting, int nId, string season)
        {
            SetUnlockScoresheet cmd = new SetUnlockScoresheet(m_conn);
            cmd.setParm("match_id", match_id);
            cmd.setParm("is_active", is_active);
            cmd.setParm("team_requesting", team_requesting);
            cmd.setParm("id", nId);
            cmd.setParm("group_name", season);
            cmd.executeNonQuery();
        }
        public void createUnlockScoresheet(int match_id, bool is_active, string team_requesting, string season)
        {
            CreateUnlockScoresheet cmd = new CreateUnlockScoresheet(m_conn);
            cmd.setParm("match_id", match_id);
            cmd.setParm("is_active", is_active);
            cmd.setParm("team_requesting", team_requesting);
            cmd.setParm("group_name", season);
            cmd.executeNonQuery();
        }

        public SqlDataReader getTournamentData(int nId)
        {
            GetTournamentData cmd = new GetTournamentData(m_conn);
            cmd.setParm("tournament_id", nId);
            return cmd.executeReader();
        }

        public SqlDataReader getPlayerSortedList(int nTeamId)
        {
            GetActivePlayerSortedList cmd = new GetActivePlayerSortedList(m_conn);
            cmd.setParm("team_id", nTeamId);
            return cmd.executeReader();
        }

        public SqlDataReader getPlayerList(int nTeamId)
        {
            GetPlayerList cmd = new GetPlayerList(m_conn);
            cmd.setParm("team_id", nTeamId);
            return cmd.executeReader();
        }

        public SqlDataReader getPlayerList(int nTeamId, bool fActiveSw)
        {
            if (fActiveSw)
            {
                GetActivePlayerList cmd = new GetActivePlayerList(m_conn);
                cmd.setParm("team_id", nTeamId);
                return cmd.executeReader();
            }
            else
            {
                GetInActivePlayerList cmd = new GetInActivePlayerList(m_conn);
                cmd.setParm("team_id", nTeamId);
                return cmd.executeReader();
            }
        }
        public SqlDataReader getPlayerReport(string groupName)
        {
            try
            {
                GetPlayerReport cmd = new GetPlayerReport(m_conn, groupName);
                // cmd.setParm("tournament_id", tournamentId);
                var result = cmd.executeReader();
                return result;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }

        }


        public SqlDataReader getPlayerData(int nPlayerId)
        {
            GetPlayerData cmd = new GetPlayerData(m_conn);
            cmd.setParm("player_id", nPlayerId);
            return cmd.executeReader();
        }
        public SqlDataReader getUnlockData(int id)
        {
            GetUnlockData cmd = new GetUnlockData(m_conn);
            cmd.setParm("id", id);
            return cmd.executeReader();
        }
        public bool checkPlayerName(int nTeamId, string strFirstName, string strLastName)
        {
            bool fFound = false;
            CheckPlayerName cmd = new CheckPlayerName(m_conn);
            cmd.setParm("first_name", strFirstName);
            cmd.setParm("last_name", strLastName);
            cmd.setParm("team_id", nTeamId);
            SqlDataReader dr = cmd.executeReader();
            if (dr.Read())
                fFound = true;
            dr.Close();
            return fFound;
        }
        public SqlDataReader getChaukaLoginData(string ChaukaUser)
        {
            GetChaukaLoginData cmd = new GetChaukaLoginData(m_conn);
            cmd.setParm("ChaukaUser", ChaukaUser);
            return cmd.executeReader();
        }
        public void setPlayerData(bool fInsert, int nTeamId, int nPlayerId, string strFirstName, string strLastName, int nAge, string strBattingStyle, string strBowlingStyle, string strBattingPos,
                                string strStartDate, string strEndDate, int nEmailId, string strEmail, int nPhoneId, string strPhone, string strComments, string strPhotoURL, bool fKeeperSw, int nTypeCd)
        {
            if (!fInsert)
            {
                setEmail(nEmailId, strEmail);
                setPhone(nPhoneId, strPhone);

                SetPlayer cmd = new SetPlayer(m_conn);
                cmd.setParm("team_id", nTeamId);
                cmd.setParm("player_id", nPlayerId);
                cmd.setParm("first_name", strFirstName);
                cmd.setParm("last_name", strLastName);
                cmd.setParm("age", nAge);
                cmd.setParm("batting_style", strBattingStyle);
                cmd.setParm("bowling_style", strBowlingStyle);
                cmd.setParm("batting_position", strBattingPos);
                cmd.setParm("start_dt", strStartDate);
                cmd.setParm("end_dt", strEndDate);
                cmd.setParm("comments", strComments);
                cmd.setParm("photo_url", strPhotoURL);
                cmd.setParm("phone_id", nPhoneId);
                cmd.setParm("email_id", nEmailId);
                cmd.setParm("keeper_sw", fKeeperSw);
                cmd.setParm("type_cd", nTypeCd);
                cmd.executeNonQuery();

            }
            else
            {
                //check if the player name already exists before creating
                if (!checkPlayerName(nTeamId, strFirstName, strLastName))
                {
                    //generate the player, email, phone ids
                    nEmailId = createEmail(strEmail);
                    nPhoneId = createPhone(strPhone);

                    CreatePlayer cmd = new CreatePlayer(m_conn);
                    cmd.setParm("team_id", nTeamId);
                    cmd.setParm("player_id", nPlayerId);
                    cmd.setParm("first_name", strFirstName);
                    cmd.setParm("last_name", strLastName);
                    cmd.setParm("age", nAge);
                    cmd.setParm("batting_style", strBattingStyle);
                    cmd.setParm("bowling_style", strBowlingStyle);
                    cmd.setParm("batting_position", strBattingPos);
                    cmd.setParm("start_dt", strStartDate);
                    cmd.setParm("end_dt", strEndDate);
                    cmd.setParm("comments", strComments);
                    cmd.setParm("photo_url", strPhotoURL);
                    cmd.setParm("phone_id", nPhoneId);
                    cmd.setParm("email_id", nEmailId);
                    cmd.setParm("keeper_sw", fKeeperSw);
                    cmd.setParm("type_cd", nTypeCd);
                    cmd.executeNonQuery();
                }
            }
        }

        public SqlDataReader getMatchList(int nTournamentId, int nTeamId)
        {
            GetMatchList cmd = new GetMatchList(m_conn);
            cmd.setParm("tournament_id", nTournamentId);
            cmd.setParm("team_id", nTeamId);
            return cmd.executeReader();
        }

        public SqlDataReader getTeamListByTeamId(int nTeamId)
        {
            GetTeamListByTeamId cmd = new GetTeamListByTeamId(m_conn);
            cmd.setParm("team_id", nTeamId);
            return cmd.executeReader();
        }

        public SqlDataReader getTeamList(bool activeOnly)
        {
            if (activeOnly)
            {
                GetTeamListActive cmd = new GetTeamListActive(m_conn);
                return cmd.executeReader();
            }
            else
            {
                GetTeamList cmd = new GetTeamList(m_conn);
                return cmd.executeReader();
            }
        }

        public SqlDataReader getTournamentList()
        {
            GetTournamentList cmd = new GetTournamentList(m_conn);
            return cmd.executeReader();
        }

        public SqlDataReader getTournamentList(int teamId)
        {
            GetTournamentListByTeam cmd = new GetTournamentListByTeam(m_conn);
            cmd.setParm("team_id", teamId);
            return cmd.executeReader();
        }
        public SqlDataReader getGroupNames()
        {
            GetGroupNames cmd = new GetGroupNames(m_conn);
            return cmd.executeReader();
        }
        public SqlDataReader getTournamentCurrent(int nTeamId, int updateDaysAfterEndDate)
        {
            GetTournamentCurrent cmd = new GetTournamentCurrent(m_conn);
            cmd.setParm("team_id", nTeamId);
            cmd.setParm("days", updateDaysAfterEndDate);
            return cmd.executeReader();
        }

        //public SqlDataReader getTournamentList()
        //{
        //    GetTournamentList cmd = new GetTournamentList(m_conn);
        //    return cmd.executeReader();
        //}

        public SqlDataReader getUnlockList()
        {
            GetUnlockList cmd = new GetUnlockList(m_conn);
            return cmd.executeReader();
        }
        public SqlDataReader getActiveUnlockList()
        {
            GetActiveUnlockList cmd = new GetActiveUnlockList(m_conn);
            return cmd.executeReader();
        }
        public SqlDataReader getTeamRegistrations(int nTournamentId, bool active)
        {
            GetTeamRegistrations cmd = new GetTeamRegistrations(m_conn);
            cmd.setParm("tournament_id", nTournamentId);
            cmd.setParm("active_sw", active);
            return cmd.executeReader();
        }


        public SqlDataReader getTeamListByTournament(int nTournamentId)
        {
            GetTeamListByTournament cmd = new GetTeamListByTournament(m_conn);
            cmd.setParm("tournament_id", nTournamentId);
            return cmd.executeReader();
        }

        public SqlDataReader getMatchData(int nMatchId)
        {
            GetMatchData cmd = new GetMatchData(m_conn);
            cmd.setParm("match_id", nMatchId);
            return cmd.executeReader();
        }

        public SqlDataReader getMatchStats(int nMatchId, int nTeamId)
        {
            GetMatchStats cmd = new GetMatchStats(m_conn);
            cmd.setParm("match_id", nMatchId);
            cmd.setParm("team_id", nTeamId);
            return cmd.executeReader();
        }

        public int getMatchInningNo(int nMatchId, int nTeamId)
        {
            int nInningNo = 1;
            GetMatchStats2 cmd = new GetMatchStats2(m_conn);
            cmd.setParm("match_id", nMatchId);
            cmd.setParm("team_id", nTeamId);
            SqlDataReader dr = cmd.executeReader();
            if (dr.Read())
            {
                nInningNo = toInt(dr["inning_sw"]);
            }
            dr.Close();
            return nInningNo;
        }

        public void setMatchStats(int nMatchId, int nTeamId, int nInningSw, int nRuns, int nWickets, float flOvers, int nExtras, int nNos, int nWides, int nByes, int nOverThrow)
        {
            SetMatchStats cmd = new SetMatchStats(m_conn);
            cmd.setParm("match_id", nMatchId);
            cmd.setParm("team_id", nTeamId);
            cmd.setParm("inning_sw", nInningSw);
            cmd.setParm("runs_scored", nRuns - nExtras);
            cmd.setParm("total_runs", nRuns);
            cmd.setParm("wickets", nWickets);
            cmd.setParm("overs", flOvers);
            cmd.setParm("extras", nExtras);
            cmd.setParm("nos", nNos);
            cmd.setParm("wides", nWides);
            cmd.setParm("byes", nByes);
            cmd.setParm("over_throw", nOverThrow);
            cmd.executeNonQuery();
        }

        public void setTeamStats(int nTournamentId, int nMatchId, int nTeam1Id, int nTeam2Id, int totalMatchOvers)
        {
            setTeamStatsCalc(nTournamentId, nMatchId, nTeam1Id, totalMatchOvers);
            setTeamStatsCalc(nTournamentId, nMatchId, nTeam2Id, totalMatchOvers);
        }

        public SqlDataReader getMatchBattingData(int nMatchId, int nTeamId)
        {
            GetMatchBattingData cmd = new GetMatchBattingData(m_conn);
            cmd.setParm("match_id", nMatchId);
            cmd.setParm("team_id", nTeamId);
            return cmd.executeReader();
        }

        public SqlDataReader getMatchBowlingData(int nMatchId, int nTeamId)
        {
            GetMatchBowlingData cmd = new GetMatchBowlingData(m_conn);
            cmd.setParm("match_id", nMatchId);
            cmd.setParm("team_id", nTeamId);
            return cmd.executeReader();
        }

        public SqlDataReader getMatchPlayerBattingData(int nMatchId, int nTeamId, int nPlayerId)
        {
            GetMatchPlayerBattingData cmd = new GetMatchPlayerBattingData(m_conn);
            cmd.setParm("match_id", nMatchId);
            cmd.setParm("team_id", nTeamId);
            cmd.setParm("player_id", nPlayerId);
            return cmd.executeReader();
        }

        public SqlDataReader getMatchPlayerBowlingData(int nMatchId, int nTeamId, int nPlayerId)
        {
            GetMatchPlayerBowlingData cmd = new GetMatchPlayerBowlingData(m_conn);
            cmd.setParm("match_id", nMatchId);
            cmd.setParm("team_id", nTeamId);
            cmd.setParm("player_id", nPlayerId);
            return cmd.executeReader();
        }

        public SqlDataReader getMatchBattingPlayerList(int nMatchId, int nTeamId)
        {
            GetMatchBattingPlayerList cmd = new GetMatchBattingPlayerList(m_conn);
            cmd.setParm("match_id", nMatchId);
            cmd.setParm("team_id", nTeamId);
            return cmd.executeReader();
        }

        public SqlDataReader getMatchBowlingPlayerList(int nMatchId, int nTeamId)
        {
            GetMatchBowlingPlayerList cmd = new GetMatchBowlingPlayerList(m_conn);
            cmd.setParm("match_id", nMatchId);
            cmd.setParm("team_id", nTeamId);
            return cmd.executeReader();
        }

        public void setMatchBatting(bool fInsert, int nTournamentId, int nMatchId, int nTeamId, int nPlayerId, string strStatus, int nFielderId, int nBowlerId, int nRuns, int nBalls, float fStrikeRate, int nFour, int nSix)
        {
            if (!fInsert)
            {
                SetMatchBatting cmd = new SetMatchBatting(m_conn);
                cmd.setParm("match_id", nMatchId);
                cmd.setParm("team_id", nTeamId);
                cmd.setParm("player_id", nPlayerId);
                cmd.setParm("status", strStatus);
                cmd.setParm("fielder_id", nFielderId);
                cmd.setParm("bowler_id", nBowlerId);
                cmd.setParm("runs", nRuns);
                cmd.setParm("balls", nBalls);
                cmd.setParm("strike_rate", fStrikeRate);
                cmd.setParm("four", nFour);
                cmd.setParm("six", nSix);
                cmd.executeNonQuery();
            }
            else
            {
                int nSeqNo = 1;

                GetMatchBattingSeqNo cmd1 = new GetMatchBattingSeqNo(m_conn);
                cmd1.setParm("match_id", nMatchId);
                cmd1.setParm("team_id", nTeamId);
                SqlDataReader dr = cmd1.executeReader();
                if (dr.Read())
                {
                    nSeqNo = toInt(dr["seq_no"]);
                }
                dr.Close();

                CreateMatchBatting cmd = new CreateMatchBatting(m_conn);
                cmd.setParm("match_id", nMatchId);
                cmd.setParm("team_id", nTeamId);
                cmd.setParm("player_id", nPlayerId);
                cmd.setParm("seq_no", nSeqNo);
                cmd.setParm("status", strStatus);
                cmd.setParm("fielder_id", nFielderId);
                cmd.setParm("bowler_id", nBowlerId);
                cmd.setParm("runs", nRuns);
                cmd.setParm("balls", nBalls);
                cmd.setParm("strike_rate", fStrikeRate);
                cmd.setParm("four", nFour);
                cmd.setParm("six", nSix);
                cmd.executeNonQuery();
            }

            //set player stats
            setPlayerBattingStats(nTournamentId, nPlayerId);

        }

        public void setMatchBowling(bool fInsert, int nTournamentId, int nMatchId, int nTeamId, int nPlayerId, float flOvers, int nMaiden, int nRuns, int nWickets, int nWideBalls, int nNoBalls)
        {
            float flEconomyRate = Overs.getEconomyRate(nRuns, Overs.getBalls(flOvers));

            if (!fInsert)
            {
                SetMatchBowling cmd = new SetMatchBowling(m_conn);
                cmd.setParm("match_id", nMatchId);
                cmd.setParm("team_id", nTeamId);
                cmd.setParm("player_id", nPlayerId);
                cmd.setParm("overs", flOvers);
                cmd.setParm("maiden", nMaiden);
                cmd.setParm("runs", nRuns);
                cmd.setParm("wickets", nWickets);
                cmd.setParm("wide_balls", nWideBalls);
                cmd.setParm("no_balls", nNoBalls);
                cmd.setParm("average", flEconomyRate);
                cmd.executeNonQuery();
            }
            else
            {
                int nSeqNo = 1;

                GetMatchBowlingSeqNo cmd1 = new GetMatchBowlingSeqNo(m_conn);
                cmd1.setParm("match_id", nMatchId);
                cmd1.setParm("team_id", nTeamId);
                SqlDataReader dr = cmd1.executeReader();
                if (dr.Read())
                {
                    nSeqNo = toInt(dr["seq_no"]);
                }
                dr.Close();

                CreateMatchBowling cmd = new CreateMatchBowling(m_conn);
                cmd.setParm("match_id", nMatchId);
                cmd.setParm("team_id", nTeamId);
                cmd.setParm("player_id", nPlayerId);
                cmd.setParm("seq_no", nSeqNo);
                cmd.setParm("overs", flOvers);
                cmd.setParm("maiden", nMaiden);
                cmd.setParm("runs", nRuns);
                cmd.setParm("wickets", nWickets);
                cmd.setParm("wide_balls", nWideBalls);
                cmd.setParm("no_balls", nNoBalls);
                cmd.setParm("average", flEconomyRate);
                cmd.executeNonQuery();
            }

            //set player stats
            setPlayerBowlingStats(nTournamentId, nPlayerId);
        }


        public int getPlayerMatchCount(int nPlayerId, int nTournamentId)
        {
            int nMatches = 0;
            GetPlayerMatchCount cmd = new GetPlayerMatchCount(m_conn);
            cmd.setParm("player_id", nPlayerId);
            cmd.setParm("tournament_id", nTournamentId);
            SqlDataReader dr = cmd.executeReader();
            if (dr.Read())
            {
                nMatches = toInt(dr["matches"]);
            }
            dr.Close();
            return nMatches;
        }

        public SqlDataReader getPlayerBattingData(int nPlayerId, int nTournamentId)
        {
            GetPlayerBattingData cmd = new GetPlayerBattingData(m_conn);
            cmd.setParm("player_id", nPlayerId);
            cmd.setParm("tournament_id", nTournamentId);
            return cmd.executeReader();
        }

        public SqlDataReader getPlayerBowlingData(int nPlayerId, int nTournamentId)
        {
            GetPlayerBowlingData cmd = new GetPlayerBowlingData(m_conn);
            cmd.setParm("player_id", nPlayerId);
            cmd.setParm("tournament_id", nTournamentId);
            return cmd.executeReader();
        }

        public SqlDataReader getPlayerBattingStats(int nTournamentId, int nPlayerId)
        {
            GetPlayerBattingStats cmd = new GetPlayerBattingStats(m_conn);
            cmd.setParm("tournament_id", nTournamentId);
            cmd.setParm("player_id", nPlayerId);
            return cmd.executeReader();
        }

        public SqlDataReader getPlayerBowlingStats(int nTournamentId, int nPlayerId)
        {
            GetPlayerBowlingStats cmd = new GetPlayerBowlingStats(m_conn);
            cmd.setParm("tournament_id", nTournamentId);
            cmd.setParm("player_id", nPlayerId);
            return cmd.executeReader();
        }
        public SqlDataReader getPlayerBowlingStatsAllRevised(int nPlayerId)
        {
            string cmdText = string.Format("Select sum(A.Matches) Matches, sum(A.Innings) Innings, sum(A.Overs) Overs, sum(A.wickets) Wickets, sum(A.Runs) Runs, " +
                "Sum(A.Maidens) Maidens , ROUND(AVG(A.Average), 2) Average, MAX(A.best)  Best " +
                "from player_bowling A , Player B where A.Player_ID = B.Player_id and A.player_id = {0} ", nPlayerId);
            using (SqlCommand com = new SqlCommand(cmdText, m_conn.getConnection()))
            {
                com.CommandType = System.Data.CommandType.Text;
                return com.ExecuteReader();
            }
        }
        public SqlDataReader getAllPlayersBattingStats(int nTournamentId, int nTeamId)
        {
            GetAllPlayersBattingStats cmd = new GetAllPlayersBattingStats(m_conn);
            cmd.setParm("tournament_id", nTournamentId);
            cmd.setParm("team_id", nTeamId);
            return cmd.executeReader();
        }

        public SqlDataReader getAllPlayersBowlingStats(int nTournamentId, int nTeamId)
        {
            GetAllPlayersBowlingStats cmd = new GetAllPlayersBowlingStats(m_conn);
            cmd.setParm("tournament_id", nTournamentId);
            cmd.setParm("team_id", nTeamId);
            return cmd.executeReader();
        }

        public void addMatch(int nTournamentId, int nTeam1Id, int nTeam2Id, int nUmpireTeamId, int nWinTeamId, int nTypeCd, DateTime MatchDt, int nGroundId, string strResult, int nMOMPlayerId, string startTime, string endTime, string umpiringText, int umpiringTeamId2)
        {
            int nMatchId = newMatchId();

            CreateMatchData cmd = new CreateMatchData(m_conn);
            cmd.setParm("match_id", nMatchId);
            cmd.setParm("tournament_id", nTournamentId);
            cmd.setParm("team1_id", nTeam1Id);
            cmd.setParm("team2_id", nTeam2Id);
            cmd.setParm("umpiring_team_id", nUmpireTeamId);
            cmd.setParm("umpiring_team2_id", umpiringTeamId2);
            cmd.setParm("umpiring_text", umpiringText);
            cmd.setParm("winning_team_id", nWinTeamId);
            cmd.setParm("type_cd", nTypeCd);
            cmd.setParm("match_dt", MatchDt);
            cmd.setParm("result", strResult);
            cmd.setParm("ground_id", nGroundId);
            cmd.setParm("mom_player_id", nMOMPlayerId);
            cmd.setParm("start_time", startTime);
            cmd.setParm("end_time", endTime);
            cmd.executeNonQuery();

            //create stats too
            addMatchStats(nMatchId, nTeam1Id, 1);
            addMatchStats(nMatchId, nTeam2Id, 2);
        }

        /// <summary>
        /// This is called from the admin section schedule_edit page
        /// </summary>
        /// <param name="nMatchId"></param>
        /// <param name="nTournamentId"></param>
        /// <param name="nTeam1Id"></param>
        /// <param name="nTeam2Id"></param>
        /// <param name="nUmpireTeamId"></param>
        /// <param name="nWinTeamId"></param>
        /// <param name="nTypeCd"></param>
        /// <param name="MatchDt"></param>
        /// <param name="nGroundId"></param>
        /// <param name="strResult"></param>
        /// <param name="nMOMPlayerId"></param>
        public void setMatch(int nMatchId, int nTournamentId, int nTeam1Id, int nTeam2Id, int nUmpireTeamId, int nWinTeamId, int nTypeCd, DateTime MatchDt, int nGroundId, string strResult, int nMOMPlayerId, int matchOvers, string startTime, string endTime, string umpiringText, int umpiringTeamId2)
        {
            //The call checks if the match_Stats table record (i.e. match score) exists for the match
            //If the score is present, it does not allow any updates
            //This is mainly to ensure that the math_Stats table update does not screw up the stats
            //as it update the team_id in the table for the innings.

            if (!CheckMatchStatsExists(nMatchId, nTeam1Id))
            {
                if (!CheckMatchStatsExists(nMatchId, nTeam2Id))
                {

                    SetMatchData cmd = new SetMatchData(m_conn);
                    cmd.setParm("match_id", nMatchId);
                    cmd.setParm("tournament_id", nTournamentId);
                    cmd.setParm("team1_id", nTeam1Id);
                    cmd.setParm("team2_id", nTeam2Id);
                    cmd.setParm("umpiring_team_id", nUmpireTeamId);
                    cmd.setParm("umpiring_team2_id", umpiringTeamId2);
                    cmd.setParm("umpiring_text", umpiringText);
                    cmd.setParm("winning_team_id", nWinTeamId);
                    cmd.setParm("type_cd", nTypeCd);
                    cmd.setParm("match_dt", MatchDt);
                    cmd.setParm("result", strResult);
                    cmd.setParm("ground_id", nGroundId);
                    cmd.setParm("mom_player_id", nMOMPlayerId);
                    cmd.setParm("start_time", startTime);
                    cmd.setParm("end_time", endTime);
                    cmd.executeNonQuery();

                    //this updates the teamid only for the match and the innings
                    setMatchStats(nTournamentId, nMatchId, nTeam1Id, 1);
                    setMatchStats(nTournamentId, nMatchId, nTeam2Id, 2);

                    //update the team stats
                    setTeamStats(nTournamentId, nMatchId, nTeam1Id, nTeam2Id, matchOvers);
                }
            }

        }

        public bool CheckMatchStatsExists(int nMatchId, int nTeamId)
        {
            bool exists = false;
            CheckMatchStatsExists cmd = new CheckMatchStatsExists(m_conn);
            cmd.setParm("match_id", nMatchId);
            cmd.setParm("team_id", nTeamId);
            SqlDataReader dr = cmd.executeReader();
            if (dr.Read())
                exists = true;
            dr.Close();
            return exists;
        }

        public void addMatchStats(int nMatchId, int nTeamId, int nInningsSw)
        {
            CreateMatchStats cmd = new CreateMatchStats(m_conn);
            cmd.setParm("match_id", nMatchId);
            cmd.setParm("team_id", nTeamId);
            cmd.setParm("runs_scored", 0);
            cmd.setParm("inning_sw", nInningsSw);
            cmd.setParm("total_runs", 0);
            cmd.setParm("wickets", 0);
            cmd.setParm("overs", 0);
            cmd.setParm("extras", 0);
            cmd.setParm("nos", 0);
            cmd.setParm("wides", 0);
            cmd.setParm("byes", 0);
            cmd.setParm("over_throw", 0);
            cmd.executeNonQuery();
        }

        public void setMatchStats(int nTournamentId, int nMatchId, int nTeamId, int nInningSw)
        {
            SetMatchStats2 cmd = new SetMatchStats2(m_conn);
            cmd.setParm("match_id", nMatchId);
            cmd.setParm("team_id", nTeamId);
            cmd.setParm("inning_sw", nInningSw);
            cmd.executeNonQuery();
        }


        public void setMatchResult(int nMatchId, int nWinTeamId, string strResult)
        {
            SetMatchResult cmd = new SetMatchResult(m_conn);
            cmd.setParm("match_id", nMatchId);
            cmd.setParm("winning_team_id", nWinTeamId);
            cmd.setParm("result", strResult);
            cmd.executeNonQuery();
        }

        public string getTeamName(int nTeamId)
        {
            string name = "";
            CheckTeamId cmd = new CheckTeamId(m_conn);
            cmd.setParm("team_id", nTeamId);
            using (SqlDataReader dr = cmd.executeReader())
            {
                if (dr.Read())
                    name = dr["name"].ToString();
                dr.Close();
            }
            return name;
        }

        public SqlDataReader getPlayerName(int nPlayerId)
        {
            GetPlayerName cmd = new GetPlayerName(m_conn);
            cmd.setParm("player_id", nPlayerId);
            return cmd.executeReader();
        }

        public SqlDataReader getSchedule(int nTournamentId)
        {
            GetSchedule cmd = new GetSchedule(m_conn);
            cmd.setParm("tournament_id", nTournamentId);
            return cmd.executeReader();
        }

        public SqlDataReader getSchedule2(int tournamentId, int teamId)
        {
            GetSchedule2 cmd = new GetSchedule2(m_conn);
            cmd.setParm("tournament_id", tournamentId);
            cmd.setParm("team_id", teamId);
            return cmd.executeReader();
        }

        public SqlDataReader getScheduleTop(int nTournamentId)
        {
            GetScheduleTop cmd = new GetScheduleTop(m_conn);
            cmd.setParm("tournament_id", nTournamentId);
            return cmd.executeReader();
        }

        public void deletePlayerBatting(int nTournamentId, int nMatchId, int nPlayerId)
        {
            DeletePlayerBatting cmd = new DeletePlayerBatting(m_conn);
            cmd.setParm("match_id", nMatchId);
            cmd.setParm("player_id", nPlayerId);
            cmd.executeNonQuery();

            //set player stats
            setPlayerBattingStats(nTournamentId, nPlayerId);
        }

        public void deletePlayerBowling(int nTournamentId, int nMatchId, int nPlayerId)
        {
            DeletePlayerBowling cmd = new DeletePlayerBowling(m_conn);
            cmd.setParm("match_id", nMatchId);
            cmd.setParm("player_id", nPlayerId);
            cmd.executeNonQuery();

            //set player stats
            setPlayerBowlingStats(nTournamentId, nPlayerId);
        }

        public SqlDataReader getTeamStats(int nTournamentId)
        {
            GetTeamStats cmd = new GetTeamStats(m_conn);
            cmd.setParm("tournament_id", nTournamentId);
            return cmd.executeReader();
        }

        public SqlDataReader getTeamStatsByGroup(int nTournamentId)
        {
            GetTeamStatsByGroup cmd = new GetTeamStatsByGroup(m_conn);
            cmd.setParm("tournament_id", nTournamentId);
            return cmd.executeReader();
        }

        public SqlDataReader getPenaltyAll(int nTournamentId)
        {
            GetPenaltyAll cmd = new GetPenaltyAll(m_conn);
            cmd.setParm("tournament_id", nTournamentId);
            return cmd.executeReader();
        }

        public SqlDataReader GetRecentTournaments()
        {
            using (SqlConnection con = GetSQLConnection())
            {
                using (SqlCommand com = new SqlCommand("select top 5 * from tournament order by start_dt desc", con))
                {
                    com.CommandType = System.Data.CommandType.Text;
                    con.Open();
                    return com.ExecuteReader();
                }
            }
        }

        public SqlDataReader GetTournamentWithResults()
        {
            string query = "select t.tournament_id, t.name, winner, runnersup, t.start_dt, t.end_dt, t.overs from tournament t " +
                            "left join (select 'winner' = t.name, ta.tournament_id from tournament_awards ta inner join team t on t.team_id = ta.team_id and ta.award_id = 1)  " +
                            "as ta1 on ta1.tournament_id = t.tournament_id " +
                            "left join (select 'runnersup' = t.name, ta.tournament_id from tournament_awards ta inner join team t on t.team_id = ta.team_id and ta.award_id = 2)  " +
                            "as ta2 on ta2.tournament_id = t.tournament_id " +
                            "order by start_dt desc";

            using (SqlCommand com = new SqlCommand(query, m_conn.getConnection()))
            {
                com.CommandType = System.Data.CommandType.Text;
                return com.ExecuteReader();
            }
        }

        public SqlDataReader GetAnnouncements(int count)
        {
            return GetAnnouncements(count, 0);
        }

        public SqlDataReader GetAnnouncements(int count, int tournamentId)
        {
            string cmdText = string.Empty;
            if (tournamentId > 0)
                cmdText = string.Format("select top {0} a.*, t.name from announcement a left join tournament t on a.tournament_id = t.tournament_id where a.tournament_id = {1} order by a.created_dt desc", count, tournamentId);
            else
                cmdText = string.Format("select top {0} a.*, t.name from announcement a left join tournament t on a.tournament_id = t.tournament_id order by a.created_dt desc", count);

            using (SqlCommand com = new SqlCommand(cmdText, m_conn.getConnection()))
            {
                com.CommandType = System.Data.CommandType.Text;
                return com.ExecuteReader();
            }
        }

        public void LogInfo(string module, string message)
        {
            LogMessage("Information", module, message, 0);
        }

        public void LogMessage(string type, string module, string message, int tournamentId)
        {
            string tournamentIdString = "Null";
            if (tournamentId > 0)
                tournamentIdString = tournamentId.ToString();

            using (SqlCommand com = new SqlCommand(
                string.Format("insert into log (type, module, message, created_dt, tournament_id) values ('{0}', '{1}', '{2}', '{3}', {4})",
                type, module, message, DateTime.Now, tournamentIdString), m_conn.getConnection()))
            {
                com.CommandType = System.Data.CommandType.Text;
                com.ExecuteNonQuery();
            }
        }

        public SqlDataReader GetRecentMatchResults(int tournamentId)
        {
            string cmdText = string.Format("select top 5 m.*, team1 = t1.name, team2 = t2.name, umpiring_team = t3.name, winning_team = t4.name, ground = g.name " +
                "from match m  " +
                "left join team t1 on m.team1_id = t1.team_id " +
                "left join team t2 on m.team2_id = t2.team_id " +
                "left join team t3 on m.umpiring_team_id = t3.team_id " +
                "left join team t4 on m.winning_team_id = t4.team_id " +
                "left join ground g on m.ground_id = g.ground_id " +
                "where tournament_id = {0} and winning_team_id  > 0 " +
                "order by  match_dt desc ", tournamentId);

            using (SqlCommand com = new SqlCommand(cmdText, m_conn.getConnection()))
            {
                com.CommandType = System.Data.CommandType.Text;
                return com.ExecuteReader();
            }
        }

        public SqlDataReader GetNextWeekendMatches(int tournamentId, DateTime startDate, DateTime endDate)
        {
            string cmdText = string.Format("select top 10 m.*, team1 = t1.name, team2 = t2.name, umpiring_team = t3.name, winning_team = t4.name, ground = g.name " +
                "from match m  " +
                "left join team t1 on m.team1_id = t1.team_id " +
                "left join team t2 on m.team2_id = t2.team_id " +
                "left join team t3 on m.umpiring_team_id = t3.team_id " +
                "left join team t4 on m.winning_team_id = t4.team_id " +
                "left join ground g on m.ground_id = g.ground_id " +
                "where tournament_id = {0} and match_dt >= '{1}' and match_dt <= '{2}' " +
                "order by  match_dt desc ", tournamentId, startDate, endDate);

            using (SqlCommand com = new SqlCommand(cmdText, m_conn.getConnection()))
            {
                com.CommandType = System.Data.CommandType.Text;
                return com.ExecuteReader();
            }
        }

        public void SetTeamRegistrationStatus(int tournamentId, int recId, bool active)
        {
            int activeSw = 0;
            if (active)
                activeSw = 1;

            string cmdText = string.Format("update team_registration set active_sw = {0} where tournament_id = {1} and rec_id = {2}",
                activeSw, tournamentId, recId);

            using (SqlCommand com = new SqlCommand(cmdText, m_conn.getConnection()))
            {
                com.CommandType = System.Data.CommandType.Text;
                com.ExecuteNonQuery();
            }
        }

        public SqlDataReader GetGroundList()
        {
            return GetGroundList(0);
        }

        public SqlDataReader GetGroundList(int groundId)
        {
            string cmdText;
            if (groundId == 0)
                cmdText = string.Format("select * from ground where active_sw = 1 order by name");
            else
                cmdText = string.Format("select * from ground where ground_id = {0} order by name", groundId);

            using (SqlCommand com = new SqlCommand(cmdText, m_conn.getConnection()))
            {
                com.CommandType = System.Data.CommandType.Text;
                return com.ExecuteReader();
            }
        }

        public SqlDataReader GetDivisionYears()
        {
            string cmdText = string.Format("select DISTINCT(YEAR) from team_division order by year desc");
            using (SqlCommand com = new SqlCommand(cmdText, m_conn.getConnection()))
            {
                com.CommandType = System.Data.CommandType.Text;
                return com.ExecuteReader();
            }
        }

        public SqlDataReader GetDivisionTeams(string year, string division)
        {
            string cmdText = string.Format("select t.name, td.* from team_division td inner join team t on t.team_id = td.team_id " +
                        " where year = '{0}' and division = '{1}' " +
                        " order by rank, name ", year, division);

            using (SqlCommand com = new SqlCommand(cmdText, m_conn.getConnection()))
            {
                com.CommandType = System.Data.CommandType.Text;
                return com.ExecuteReader();
            }
        }

        public SqlDataReader GetUmpiringTeams(int tournamentId)
        {
            //string cmdText = string.Format("select distinct t.team_id, t.name from team t inner join tournament_team tm " + 
            //    "on tm.team_id = t.team_id and tournament_id in  " + 
            //    "(select tournament_id from tournament  " + 
            //    "where group_name not in (select group_name from tournament where tournament_id = {0}) " + 
            //    ") order by nam" +
            //    "e", tournamentId);

            string cmdText = string.Format("select distinct t.team_id, t.name from team t inner join tournament_team tm " +
                                           "on tm.team_id = t.team_id and tournament_id in " +
                                           "(select tournament_id from tournament where  substring(name, 1, 26) = (Select distinct top 1   substring(name, 1, 26) tournament_name from tournament t " +
                                           "inner join match m on t.tournament_id = m.tournament_id " +
                                           "where t.tournament_id = {0}) " +
                                           "and group_name not in (select group_name from tournament where tournament_id = {0})) " +
                                           "order by t.name", tournamentId);

            using (SqlCommand com = new SqlCommand(cmdText, m_conn.getConnection()))
            {
                com.CommandType = System.Data.CommandType.Text;
                return com.ExecuteReader();
            }
        }


        public SqlDataReader GetLoginUserInfo(string username, string password)
        {
            string cmdText = string.Format("select u.user_id, t.team_id, t.name from users u left join team t on u.team_id = t.team_id where user_name = '{0}' and password = '{1}' ", username, password);

            using (SqlCommand com = new SqlCommand(cmdText, m_conn.getConnection()))
            {
                com.CommandType = System.Data.CommandType.Text;
                return com.ExecuteReader();
            }
        }


        public SqlDataReader GetTeamTournaments(int teamId)
        {
            string cmdText = string.Format("select t.tournament_id, team_name = t1.name, tournament_name = t.name, t.start_dt, t.end_dt, at.award_type, tt.rank, tt.lastmatch_type_cd  from tournament_team tt inner join  " +
                                            "team t1 on t1.team_id = tt.team_id and tt.team_id = {0} inner join  " +
                                            "tournament t on tt.tournament_id = t.tournament_id left join " +
                                            "tournament_awards tw on tw.team_id = tt.team_id and tw.tournament_id = t.tournament_id and tw.award_id in (1, 2) " +
                                            "left join award_types at on at.award_id = tw.award_id " +
                                            "order by t.start_dt desc ", teamId);

            using (SqlCommand com = new SqlCommand(cmdText, m_conn.getConnection()))
            {
                com.CommandType = System.Data.CommandType.Text;
                return com.ExecuteReader();
            }
        }



        public SqlDataReader GetTeamAwardsSummary()
        {
            string cmdText = string.Format("select t.name, at.award_type, ta.* from (select team_id, count = COUNT(team_id), award_id from tournament_awards where award_id in (1,2) group by team_id, award_id) as ta " +
                    "inner join team t on t.team_id = ta.team_id inner join award_types at on ta.award_id = at.award_id " +
                    "order by award_id asc, count desc");


            using (SqlCommand com = new SqlCommand(cmdText, m_conn.getConnection()))
            {
                com.CommandType = System.Data.CommandType.Text;
                return com.ExecuteReader();
            }
        }


        public SqlDataReader GetPlayerBattingStatsAll(int playerId)
        {
            string cmdText = string.Format("select * from player_batting where player_id = {0} ", playerId);

            using (SqlCommand com = new SqlCommand(cmdText, m_conn.getConnection()))
            {
                com.CommandType = System.Data.CommandType.Text;
                return com.ExecuteReader();
            }
        }
        public SqlDataReader GetPlayerBattingStatsAllRevised(int playerId)
        {
            string cmdText = string.Format("Select sum(matches) Matches, sum(Runs) Runs, sum(hundred) Hundred,sum(not_outs) NotOuts," +
                            "sum(fifty) Fifty, sum(innings) Innings, sum(Four) Four, sum(six) Six, sum(duck) Zeros, MAX(highest) Highest," +
                            "ROUND(AVG(average), 2) Average, ROUND(AVG(strike_rate), 2) StrikeRate from player_batting where player_id = {0} ", playerId);
            using (SqlCommand com = new SqlCommand(cmdText, m_conn.getConnection()))
            {
                com.CommandType = System.Data.CommandType.Text;
                return com.ExecuteReader();
            }
        }

        public SqlDataReader GetTeamTournaments2(int teamId)
        {
            string cmdText = string.Format("", teamId);

            using (SqlCommand com = new SqlCommand(cmdText, m_conn.getConnection()))
            {
                com.CommandType = System.Data.CommandType.Text;
                return com.ExecuteReader();
            }
        }
        public SqlDataReader GetTeamStatCounts(int teamId)
        {
            string cmdText = string.Format("select count(*) from tournament_team where team_id = {0}; " +
            "select count(*) from match where team1_id = {0} or team2_id = {0}; " +
            "select count(*) from match where ( team1_id = {0} or team2_id = {0}) and winning_team_id = {0}; " +
            "select count(*) from match where ( team1_id = {0} or team2_id = {0}) and winning_team_id != {0}; ", teamId);

            using (SqlCommand com = new SqlCommand(cmdText, m_conn.getConnection()))
            {
                com.CommandType = System.Data.CommandType.Text;
                return com.ExecuteReader();
            }
        }
        public int GetTeamTournamentCount(int teamId)
        {
            string cmdText = string.Format("select count(*) from tournament_team where team_id = {0} ", teamId);

            using (SqlCommand com = new SqlCommand(cmdText, m_conn.getConnection()))
            {
                com.CommandType = System.Data.CommandType.Text;
                return toInt(com.ExecuteScalar());
            }
        }
        public int GetTeamMatchCount(int teamId)
        {
            string cmdText = string.Format("select count(*) from match where team1_id = {0} or team2_id = {0}", teamId);

            using (SqlCommand com = new SqlCommand(cmdText, m_conn.getConnection()))
            {
                com.CommandType = System.Data.CommandType.Text;
                return toInt(com.ExecuteScalar());
            }
        }
        public int GetTeamWins(int teamId)
        {
            string cmdText = string.Format("select count(*) from match where ( team1_id = {0} or team2_id = {0}) and winning_team_id = {0}", teamId);

            using (SqlCommand com = new SqlCommand(cmdText, m_conn.getConnection()))
            {
                com.CommandType = System.Data.CommandType.Text;
                return toInt(com.ExecuteScalar());
            }
        }
        public int GetTeamLosses(int teamId)
        {
            string cmdText = string.Format("select count(*) from match where ( team1_id = {0} or team2_id = {0}) and winning_team_id != {0}", teamId);

            using (SqlCommand com = new SqlCommand(cmdText, m_conn.getConnection()))
            {
                com.CommandType = System.Data.CommandType.Text;
                return toInt(com.ExecuteScalar());
            }
        }
        public SqlDataReader GetTeamPlayerStats(int teamId)
        {
            string cmdText = string.Format("select name = p2.first_name + ' ' + p2.last_name, p1.* from " +
                "(select bat.player_id, matches = SUM(matches), runs = sum(runs), not_outs = sum(not_outs), " +
                "innings = sum(innings), average = avg(average), strike_rate = avg(strike_rate),  " +
                "highest = max(highest), hundred = sum(hundred), fifty = sum(fifty), four = sum(four), six = sum(six),  " +
                "duck = sum(duck) from player p  " +
                "inner join team t on p.team_id = t.team_id and p.team_id = {0} " +
                "inner join player_batting bat on bat.player_id = p.player_id " +
                "group by bat.player_id) p1 " +
                "inner join player p2 on p2.player_id = p1.player_id ", teamId);

            using (SqlCommand com = new SqlCommand(cmdText, m_conn.getConnection()))
            {
                com.CommandType = System.Data.CommandType.Text;
                return com.ExecuteReader();
            }
        }



        public SqlDataReader GetStatsCenturians(int tournamentId)
        {
            string cmdText = string.Format("select top 20 name = p.first_name + ' ' + p.last_name, team_name = t.name, pb.*  " +
                    "from player p inner join player_batting pb on pb.player_id = p.player_id  " +
                    "and (p.end_dt = '' or p.end_dt = NULL) and pb.tournament_id = {0}  " +
                    "inner join team t on p.team_id = t.team_id and hundred > 0 " +
                    "order by pb.highest desc, pb.average desc ", tournamentId);

            using (SqlCommand com = new SqlCommand(cmdText, m_conn.getConnection()))
            {
                com.CommandType = System.Data.CommandType.Text;
                return com.ExecuteReader();
            }
        }


        public int AddPenaltyPoints(int tournamentId, int teamId, int penaltypoints, string desc, int typeCode)
        {

            // add the penalty points to the penalty table
            int penaltyId = 0;
            SqlConnection conn = m_conn.getConnection();
            using (SqlCommand com = new SqlCommand("select MAX(penalty_id)+1 from penalty", conn))
            {
                com.CommandType = System.Data.CommandType.Text;
                penaltyId = toInt(com.ExecuteScalar());
            }

            if (penaltyId <= 0)
                penaltyId = 1;

            string cmdText = string.Format("insert into penalty (penalty_id, tournament_id, team_id, type_code, points, verbose) values ({0}, {1}, {2}, {3}, {4}, '{5}') ",
                penaltyId, tournamentId, teamId, typeCode, penaltypoints, desc);

            using (SqlCommand com = new SqlCommand(cmdText, conn))
            {
                com.CommandType = System.Data.CommandType.Text;
                com.ExecuteNonQuery();
            }

            // update the tournament_team table to adjust the total team points
            int totalpoints = 0;
            cmdText = string.Format("select points from tournament_team where tournament_id = {0} and team_id = {1}", tournamentId, teamId);
            using (SqlCommand com = new SqlCommand(cmdText, conn))
            {
                com.CommandType = System.Data.CommandType.Text;
                totalpoints = toInt(com.ExecuteScalar());
            }

            totalpoints += penaltypoints;

            cmdText = string.Format("update tournament_team set points = {0} where tournament_id = {1} and team_id = {2} ", totalpoints, tournamentId, teamId);
            using (SqlCommand com = new SqlCommand(cmdText, conn))
            {
                com.CommandType = System.Data.CommandType.Text;
                return com.ExecuteNonQuery();
            }
        }

        public int DeletePenalty(int tournamentId, int penaltyId, int teamId, int penaltypoints)
        {
            string cmdText = string.Empty;
            SqlConnection conn = m_conn.getConnection();

            DeletePenalty cmd = new DeletePenalty(m_conn);
            cmd.setParm("tournament_id", tournamentId);
            cmd.setParm("penalty_id", penaltyId);
            cmd.executeNonQuery();

            // update the tournament_team table to adjust the total team points
            int totalpoints = 0;
            cmdText = string.Format("select points from tournament_team where tournament_id = {0} and team_id = {1}", tournamentId, teamId);
            using (SqlCommand com = new SqlCommand(cmdText, conn))
            {
                com.CommandType = System.Data.CommandType.Text;
                totalpoints = toInt(com.ExecuteScalar());
            }

            totalpoints -= penaltypoints;

            cmdText = string.Format("update tournament_team set points = {0} where tournament_id = {1} and team_id = {2} ", totalpoints, tournamentId, teamId);
            using (SqlCommand com = new SqlCommand(cmdText, conn))
            {
                com.CommandType = System.Data.CommandType.Text;
                return com.ExecuteNonQuery();
            }
        }

        public SqlDataReader GetPlayerRegistrations(int tournamentId)
        {
            string cmdText = string.Format("select * from player_registration where tournament_id = {0}", tournamentId);

            using (SqlCommand com = new SqlCommand(cmdText, m_conn.getConnection()))
            {
                com.CommandType = System.Data.CommandType.Text;
                return com.ExecuteReader();
            }
        }


        public SqlDataReader GetBonusData(int matchId)
        {
            string cmdText = string.Format("select t.name, b.* from bonus b inner join team t on t.team_id = b.team_id and b.match_id = {0}", matchId);

            using (SqlCommand com = new SqlCommand(cmdText, m_conn.getConnection()))
            {
                com.CommandType = System.Data.CommandType.Text;
                return com.ExecuteReader();
            }
        }

        public void SetBonusPoints(int tournamentId, int matchId, int teamId, string reason, string description, int points)
        {
            using (SqlCommand com = new SqlCommand(
                string.Format("insert into bonus (match_id, team_id, reason, description, points) values ({0}, {1}, '{2}', '{3}', {4})",
                matchId, teamId, reason, description, points), m_conn.getConnection()))
            {
                com.CommandType = System.Data.CommandType.Text;
                com.ExecuteNonQuery();
            }

            int penaltyId = 0;
            int bonusPoints = 0;
            using (SqlCommand com = new SqlCommand(
                string.Format("select penalty_id, points from penalty where tournament_id = {0} and team_id = {1} and type_code = 3 ",
                tournamentId, teamId), m_conn.getConnection()))
            {
                com.CommandType = System.Data.CommandType.Text;

                using (SqlDataReader dr = com.ExecuteReader())
                {
                    if (dr.Read())
                    {
                        penaltyId = toInt(dr["penalty_id"]);
                        bonusPoints = toInt(dr["points"]);
                    }
                }
            }

            if (penaltyId == 0)
            {
                using (SqlCommand com = new SqlCommand(
                    string.Format("insert into penalty (tournament_id, team_id, type_code, points, verbose) values ({0}, {1}, 3, {2}, 'Bonus Points')",
                    tournamentId, teamId, points), m_conn.getConnection()))
                {
                    com.CommandType = System.Data.CommandType.Text;
                    com.ExecuteNonQuery();
                }
            }
            else
            {
                bonusPoints += points;

                using (SqlCommand com = new SqlCommand(
                    string.Format("update penalty set points = {0} where penalty_id = {1} ",
                    bonusPoints, penaltyId), m_conn.getConnection()))
                {
                    com.CommandType = System.Data.CommandType.Text;
                    com.ExecuteNonQuery();
                }

            }

        }

        public SqlDataReader GetMatchTeams(int matchId)
        {
            string cmdText = string.Format("select t.name, b.* from bonus b inner join team t on t.team_id = b.team_id and b.match_id = {0}", matchId);

            using (SqlCommand com = new SqlCommand(cmdText, m_conn.getConnection()))
            {
                com.CommandType = System.Data.CommandType.Text;
                return com.ExecuteReader();
            }
        }

        ////////////////////////////////////////////////////////////////////
        //Helper Methods
        ///////////////////////////////////////////////////////////////////

        #region Helper Methods

        //Player bowling stats
        protected void setPlayerBattingStats(int nTournamentId, int nPlayerId)
        {

            //LogMessage("Information", "Stats", "setPlayerBattingStats: " + nPlayerId.ToString() + ": start", nTournamentId);

            //update the player statistics
            int nMatches = 0;
            int nInnings = 0;
            int nNotOuts = 0;
            int nRuns = 0;
            int nTotalBalls = 0;
            int nTotalRuns = 0;
            int nHighest = 0;
            int nHundreds = 0;
            int nFifties = 0;
            int nFours = 0;
            int nSixes = 0;
            int nDucks = 0;
            int nMatchId = 0;
            string strStatus;
            SqlDataReader dr = getPlayerBattingData(nPlayerId, nTournamentId);
            while (dr.Read())
            {

                strStatus = dr["status"].ToString();
                nRuns = toInt(dr["runs"]);
                nTotalBalls += toInt(dr["balls"]);
                nFours += toInt(dr["four"]);
                nSixes += toInt(dr["six"]);

                if (nRuns == 0 && strStatus != BattingStatus.DNP)
                    nDucks++;

                //process status
                if (strStatus != BattingStatus.DNP)
                    nInnings++;
                if (strStatus == BattingStatus.NotOut)
                    nNotOuts++;

                //calculate 100 and 50's
                if (nRuns >= 100)
                    nHundreds++;
                else if (nRuns >= 50)
                    nFifties++;

                //calculate the highest score
                if (nRuns > nHighest)
                {
                    nHighest = nRuns;
                    nMatchId = toInt(dr["match_id"]);
                }

                nTotalRuns += nRuns;
                nMatches++;
            }
            dr.Close();

            //LogMessage("Information", "Stats", "setPlayerBattingStats: " + nPlayerId.ToString() + ": after while", nTournamentId);


            //get highest vs team id
            int nHigeshtVsTeamId = 0;
            if (nMatchId > 0)
            {

                //LogMessage("Information", "Stats", "setPlayerBattingStats: " + nPlayerId.ToString() + ": getteamidforhishestscore", nTournamentId);

                GetTeamIdForHighestScore cmd2 = new GetTeamIdForHighestScore(m_conn);
                cmd2.setParm("match_id", nMatchId);
                cmd2.setParm("player_id", nPlayerId);
                dr = cmd2.executeReader();
                if (dr.Read())
                {
                    if (!dr.IsDBNull(dr.GetOrdinal("team_id")))
                        nHigeshtVsTeamId = toInt(dr["team_id"]);
                }
                dr.Close();
            }

            float flAverage = nTotalRuns;
            int nTemp = nInnings - nNotOuts;
            if (nTemp > 0)
                flAverage = (float)nTotalRuns / (float)nTemp;

            float flStrikeRate = 0;
            if (nTotalBalls > 0)
                flStrikeRate = ((float)nTotalRuns / (float)nTotalBalls) * (float)100;


            //update stats
            bool fInsert = true;
            CheckPlayerBattingStats cmd1 = new CheckPlayerBattingStats(m_conn);
            cmd1.setParm("player_id", nPlayerId);
            cmd1.setParm("tournament_id", nTournamentId);
            dr = cmd1.executeReader();
            if (dr.Read())
                fInsert = false;
            dr.Close();

            if (!fInsert)
            {
                //LogMessage("Information", "Stats", "setPlayerBattingStats: " + nPlayerId.ToString() + ": insert", nTournamentId);

                SetPlayerBattingStats cmd = new SetPlayerBattingStats(m_conn);
                cmd.setParm("player_id", nPlayerId);
                cmd.setParm("tournament_id", nTournamentId);
                cmd.setParm("matches", nMatches);
                cmd.setParm("innings", nInnings);
                cmd.setParm("runs", nTotalRuns);
                cmd.setParm("not_outs", nNotOuts);
                cmd.setParm("average", flAverage);
                cmd.setParm("strike_rate", flStrikeRate);
                cmd.setParm("highest", nHighest);
                cmd.setParm("hundred", nHundreds);
                cmd.setParm("fifty", nFifties);
                cmd.setParm("four", nFours);
                cmd.setParm("six", nSixes);
                cmd.setParm("duck", nDucks);
                cmd.setParm("highestvs_team_id", nHigeshtVsTeamId);
                cmd.executeNonQuery();
            }
            else
            {
                //LogMessage("Information", "Stats", "setPlayerBattingStats: " + nPlayerId.ToString() + ": update", nTournamentId);

                CreatePlayerBattingStats cmd = new CreatePlayerBattingStats(m_conn);
                cmd.setParm("player_id", nPlayerId);
                cmd.setParm("tournament_id", nTournamentId);
                cmd.setParm("matches", nMatches);
                cmd.setParm("innings", nInnings);
                cmd.setParm("runs", nTotalRuns);
                cmd.setParm("not_outs", nNotOuts);
                cmd.setParm("average", flAverage);
                cmd.setParm("strike_rate", flStrikeRate);
                cmd.setParm("highest", nHighest);
                cmd.setParm("hundred", nHundreds);
                cmd.setParm("fifty", nFifties);
                cmd.setParm("four", nFours);
                cmd.setParm("six", nSixes);
                cmd.setParm("duck", nDucks);
                cmd.setParm("highestvs_team_id", nHigeshtVsTeamId);
                cmd.executeNonQuery();
            }


        }

        //Player bowling stats
        protected void setPlayerBowlingStats(int nTournamentId, int nPlayerId)
        {
            //get the match count 
            int nMatches = getPlayerMatchCount(nPlayerId, nTournamentId);

            int nInnings = 0;
            int nRuns = 0;
            int nTotalRuns = 0;
            int nWickets = 0;
            int nBestWickets = 0;
            int nBestRuns = 0;
            int nTotalWickets = 0;
            int nMaidens = 0;
            int nTotalBalls = 0;
            SqlDataReader dr = getPlayerBowlingData(nPlayerId, nTournamentId);
            while (dr.Read())
            {
                nInnings++;

                nTotalBalls += Overs.getBalls(toFloat(dr["overs"]));
                nRuns = toInt(dr["runs"]);
                nWickets = toInt(dr["wickets"]);
                nMaidens += toInt(dr["maiden"]);

                //calculate the best figures
                if (nWickets >= nBestWickets)
                {
                    if (nWickets > nBestWickets)
                    {
                        nBestWickets = nWickets;
                        nBestRuns = nRuns;
                    }
                    else if (nRuns < nBestRuns || nBestRuns == 0)
                    {
                        nBestRuns = nRuns;
                    }
                }

                nTotalRuns += nRuns;
                nTotalWickets += nWickets;
            }
            dr.Close();

            float flTotalOvers = Overs.getOvers(nTotalBalls);
            float flAverage = Overs.getAverage(nTotalRuns, nTotalWickets);
            float flEconomyRate = Overs.getEconomyRate(nTotalRuns, nTotalBalls);
            string strBest = nBestWickets.ToString() + "/" + nBestRuns.ToString();

            if (nMatches < nInnings)
                nMatches = nInnings;


            //update the stats
            bool fInsert = true;
            CheckPlayerBowlingStats cmd1 = new CheckPlayerBowlingStats(m_conn);
            cmd1.setParm("player_id", nPlayerId);
            cmd1.setParm("tournament_id", nTournamentId);
            dr = cmd1.executeReader();
            if (dr.Read())
                fInsert = false;
            dr.Close();

            if (!fInsert)
            {
                SetPlayerBowlingStats cmd = new SetPlayerBowlingStats(m_conn);
                cmd.setParm("player_id", nPlayerId);
                cmd.setParm("tournament_id", nTournamentId);
                cmd.setParm("matches", nMatches);
                cmd.setParm("innings", nInnings);
                cmd.setParm("overs", flTotalOvers);
                cmd.setParm("maidens", nMaidens);
                cmd.setParm("wickets", nTotalWickets);
                cmd.setParm("runs", nTotalRuns);
                cmd.setParm("average", flAverage);
                cmd.setParm("economy_rate", flEconomyRate);
                cmd.setParm("best", strBest);
                cmd.executeNonQuery();
            }
            else
            {
                CreatePlayerBowlingStats cmd = new CreatePlayerBowlingStats(m_conn);
                cmd.setParm("player_id", nPlayerId);
                cmd.setParm("tournament_id", nTournamentId);
                cmd.setParm("matches", nMatches);
                cmd.setParm("innings", nInnings);
                cmd.setParm("overs", flTotalOvers);
                cmd.setParm("maidens", nMaidens);
                cmd.setParm("wickets", nTotalWickets);
                cmd.setParm("runs", nTotalRuns);
                cmd.setParm("average", flAverage);
                cmd.setParm("economy_rate", flEconomyRate);
                cmd.setParm("best", strBest);
                cmd.executeNonQuery();
            }
        }


        /// <summary>
        /// Indicates if teams stats should be updated
        /// Team stats are updatable for group matches and league matches to maintain rankings
        /// Team stats are not updatable for playoffs - quaterfinals, semis, finals 
        /// </summary>
        /// <returns></returns>
        public bool ShouldUpdateTeamStats(int nMatchId)
        {
            int nTypeCd = 0;

            GetMatchType cmd = new GetMatchType(m_conn);
            cmd.setParm("match_id", nMatchId);
            SqlDataReader dr = cmd.executeReader();
            if (dr.Read())
            {
                nTypeCd = toInt(dr["type_cd"]);
            }
            dr.Close();

            return MatchTypeCd.IsMatchTypeValidForStats(nTypeCd);
        }


        protected void setTeamStatsCalc(int nTournamentId, int nCurrentMatchId, int nTeamId, int totalMatchOvers)
        {
            //check if team stats should be updated
            if (!ShouldUpdateTeamStats(nCurrentMatchId))
                return;

            setTeamStatsCalc(nTournamentId, nTeamId, totalMatchOvers);
        }

        public void setPlayerStatsCalc(int tournamentId)
        {
            if (tournamentId <= 0)
                throw new Exception("Tournament Id is invalid");

            setPlayerBattingStatsCalc(tournamentId);
            setPlayerBowlingStatsCalc(tournamentId);
        }

        public void setPlayerBattingStatsCalc(int tournamentId)
        {
            if (tournamentId <= 0)
                throw new Exception("Tournament Id is invalid");

            ArrayList players = new ArrayList();
            string cmdText = string.Format("select distinct(player_id) from match_Batting where match_id in (select match_id from match where tournament_id = {0}) group by player_id ", tournamentId);
            using (SqlCommand com = new SqlCommand(cmdText, m_conn.getConnection()))
            {
                com.CommandType = System.Data.CommandType.Text;
                using (SqlDataReader dr = com.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        players.Add(toInt(dr["player_id"].ToString()));
                    }
                    dr.Close();
                }
            }

            foreach (int playerId in players)
            {
                setPlayerBattingStats(tournamentId, playerId);
            }

        }

        public void setPlayerBowlingStatsCalc(int tournamentId)
        {
            if (tournamentId <= 0)
                throw new Exception("Tournament Id is invalid");

            ArrayList players = new ArrayList();
            string cmdText = string.Format("select distinct(player_id) from match_Bowling where match_id in (select match_id from match where tournament_id = {0}) group by player_id ", tournamentId);
            using (SqlCommand com = new SqlCommand(cmdText, m_conn.getConnection()))
            {
                com.CommandType = System.Data.CommandType.Text;
                using (SqlDataReader dr = com.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        players.Add(toInt(dr["player_id"].ToString()));
                    }
                    dr.Close();
                }
            }

            foreach (int playerId in players)
            {
                setPlayerBowlingStats(tournamentId, playerId);
            }

        }


        public int setTeamStatsCalc(int nTournamentId)
        {
            //Note: this will screw up the stats for matches that had reduced overs since we are not keeping the number of reduced overs per match at this time

            if (nTournamentId <= 0)
                throw new Exception("Tournament Id is invalid");

            int totalMatchOvers = 0;
            SqlDataReader dr = getTournamentData(nTournamentId);
            if (dr.Read())
            {
                totalMatchOvers = toInt(dr["overs"].ToString());
            }
            dr.Close();

            if (totalMatchOvers <= 0)
                throw new Exception("Total match overs <= 0");

            ArrayList teams = new ArrayList();
            dr = getTeamListByTournament(nTournamentId);
            while (dr.Read())
            {
                teams.Add(toInt(dr["team_id"].ToString()));
            }
            dr.Close();

            foreach (int teamId in teams)
            {
                setTeamStatsCalc(nTournamentId, teamId, totalMatchOvers);
            }

            return teams.Count;
        }


        /// <summary>
        /// Calculates the statistics for all the matches in the tournament
        /// Includes only the valid matches for stats calculations by type_cd
        /// i.e. does not include the playoff matches for stats calculations
        /// </summary>
        /// <param name="nTournamentId"></param>
        /// <param name="nTeamId"></param>
        protected void setTeamStatsCalc(int nTournamentId, int nTeamId, int totalMatchOvers)
        {
            SqlDataReader dr = null;
            try
            {
                //LogMessage("Information", "Stats", "setTeamStatsCalc: TeamId=" + nTeamId.ToString(), nTournamentId);

                //get the matches for this tournament 
                //and filter by the type_cd column to filter out playoff matches 
                GetTeamMatches cmd = new GetTeamMatches(m_conn);
                cmd.setParm("tournament_id", nTournamentId);
                cmd.setParm("team_id", nTeamId);

                int nMatchPlayed = 0;
                int nMatchWon = 0;
                int nMatchLost = 0;
                int nMatchTied = 0;
                int nMatchStatusTied = -1;
                ArrayList matchIdList = new ArrayList();
                dr = cmd.executeReader();
                while (dr.Read())
                {
                    int nMatchId = 0;
                    int nWinningTeamId = 0;
                    int nTypeCd = 0;
                    if (!dr.IsDBNull(dr.GetOrdinal("match_id")))
                        nMatchId = toInt(dr["match_id"]);
                    if (!dr.IsDBNull(dr.GetOrdinal("winning_team_id")))
                        nWinningTeamId = toInt(dr["winning_team_id"]);
                    if (!dr.IsDBNull(dr.GetOrdinal("type_cd")))
                        nTypeCd = toInt(dr["type_cd"]);

                    //ensure that the match type is valid for stats calculation
                    if (MatchTypeCd.IsMatchTypeValidForStats(nTypeCd))
                    {
                        if (nWinningTeamId == nTeamId)
                            nMatchWon++;
                        else if (nWinningTeamId == nMatchStatusTied)
                            nMatchTied++;
                        else
                            nMatchLost++;

                        matchIdList.Add(nMatchId);
                    }
                }
                dr.Close();

                nMatchPlayed = matchIdList.Count;

                // add logging for troubleshooting
                //LogMessage("Information", "Stats", "match data processing", nTournamentId);

                //LogMessage("Information", "Stats", "nMatchPlayed: " + nMatchPlayed.ToString(), nTournamentId);

                //System.Text.StringBuilder sb = new System.Text.StringBuilder();

                //calculate stats from all the matches
                int nForRuns = 0;
                int nOppRuns = 0;
                int nForBalls = 0;
                int nOppBalls = 0;
                foreach (int nMatchId in matchIdList)
                {
                    ////LogMessage("Information", "Stats", "match: " + nMatchId.ToString(), nTournamentId);

                    GetMatchStatsAll cmd1 = new GetMatchStatsAll(m_conn);
                    cmd1.setParm("match_id", nMatchId);
                    dr = cmd1.executeReader();
                    while (dr.Read())
                    {
                        int nMatchTeamId = 0;
                        int nRuns = 0;
                        int nWickets = 0;
                        float flOvers = 0;
                        if (!dr.IsDBNull(dr.GetOrdinal("team_id")))
                            nMatchTeamId = toInt(dr["team_id"]);
                        if (!dr.IsDBNull(dr.GetOrdinal("total_runs")))
                            nRuns = toInt(dr["total_runs"]);
                        if (!dr.IsDBNull(dr.GetOrdinal("overs")))
                            flOvers = toFloat(dr["overs"]);
                        if (!dr.IsDBNull(dr.GetOrdinal("wickets")))
                            nWickets = toInt(dr["wickets"]);

                        //sb.AppendLine(string.Format("MatchID={0} R={1} W={2} O={3}", nMatchId, nRuns, nWickets, flOvers));

                        //TODO: Store # of players for the match 
                        //to calculate proper statistics
                        //hardcoding for now 
                        int nFixedWickets = 10;
                        if (nWickets == nFixedWickets)
                            flOvers = totalMatchOvers;

                        //sb.AppendLine(string.Format("MatchID={0} R={1} W={2} O={3}", nMatchId, nRuns, nWickets, flOvers));

                        if (nMatchTeamId == nTeamId)
                        {
                            nForRuns += nRuns;
                            nForBalls += Overs.getBalls(flOvers);
                        }
                        else
                        {
                            nOppRuns += nRuns;
                            nOppBalls += Overs.getBalls(flOvers);
                        }

                        //sb.AppendLine(string.Format("forR={0} forB={1} oppR={2} oppB={3}", nForRuns, nForBalls, nOppRuns, nOppBalls));

                    }
                    dr.Close();
                }

                //LogMessage("Information", "Stats", sb.ToString(), nTournamentId);

                /*
                System.Text.StringBuilder sb2 = new System.Text.StringBuilder();
                sb2.AppendLine(" Balls=" + Overs.getBalls((float)19).ToString());
                sb2.AppendLine(" Balls=" + Overs.getBalls((float)19.1).ToString());
                sb2.AppendLine(" Balls=" + Overs.getBalls((float)19.2).ToString());
                sb2.AppendLine(" Balls=" + Overs.getBalls((float)19.3).ToString());
                sb2.AppendLine(" Balls=" + Overs.getBalls((float)19.4).ToString());
                sb2.AppendLine(" Balls=" + Overs.getBalls((float)19.5).ToString());
                sb2.AppendLine(" Balls=" + Overs.getBalls((float)19.6).ToString());
                LogMessage("Information", "Stats", sb2.ToString(), nTournamentId);
                */

                // Note: Penalty table is now used for byes and penalties
                // penalties are represented by negative points
                // byes are represented by positive points

                //calculate the points - apply the penalty if exists
                int nPenalty = 0;
                GetTeamPenalty cmd3 = new GetTeamPenalty(m_conn);
                cmd3.setParm("tournament_id", nTournamentId);
                cmd3.setParm("team_id", nTeamId);
                dr = cmd3.executeReader();
                while (dr.Read())
                {
                    if (!dr.IsDBNull(dr.GetOrdinal("points")))
                        nPenalty = toInt(dr["points"]);
                }
                dr.Close();

                int nPoints = (nMatchWon * Points.Won) + (nMatchTied * Points.Tied) + (nMatchLost * Points.Lost);
                nPoints += nPenalty;

                //calculate run rate
                float flForRR = RunRate.getRunRate(nForRuns, nForBalls);
                float flOppRR = RunRate.getRunRate(nOppRuns, nOppBalls);
                float flNetRR = flForRR - flOppRR;

                float flForOvers = Overs.getOvers(nForBalls);
                float flOppOvers = Overs.getOvers(nOppBalls);

                //LogMessage("Information", "Stats", string.Format("forRR={0} oppRR={1} forO={2} oppO={3} netRR={4}", flForRR, flOppRR, flForOvers, flOppOvers, flNetRR), nTournamentId);



                SetTeamStats cmd2 = new SetTeamStats(m_conn);
                cmd2.setParm("team_id", nTeamId);
                cmd2.setParm("tournament_id", nTournamentId);
                cmd2.setParm("played", nMatchPlayed);
                cmd2.setParm("won", nMatchWon);
                cmd2.setParm("lost", nMatchLost);
                cmd2.setParm("tie", nMatchTied);
                cmd2.setParm("for_runs", nForRuns);
                cmd2.setParm("for_overs", flForOvers);
                cmd2.setParm("for_rr", flForRR);
                cmd2.setParm("opp_runs", nOppRuns);
                cmd2.setParm("opp_overs", flOppOvers);
                cmd2.setParm("opp_rr", flOppRR);
                cmd2.setParm("net_rr", flNetRR);
                cmd2.setParm("points", nPoints);
                cmd2.executeNonQuery();

                //LogMessage("Information", "Stats", "setTeamStatsCalc done", nTournamentId);
            }
            catch (Exception ex)
            {
                LogMessage("Error", "setTeamStatsCalc", ex.ToString(), nTournamentId);
                if (dr != null)
                    dr.Close();
                throw;
            }

        }
        #endregion


    }



}
