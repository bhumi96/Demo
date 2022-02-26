using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Windows.Input;
using System.Data;
using System.Windows.Forms;

namespace CRUD1
{
    public partial class crudOperation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getStudent();
            }
        }

        protected void btnReg_Click(object sender, EventArgs e)
        {
            dbconnection db = new dbconnection();
            using (MySqlConnection con = new MySqlConnection(db.connstr))
            {
                string dob = string.Format("{0}", Request.Form["dob"]);
                DateTime date = Convert.ToDateTime(dob);
                string dt = date.ToString("yyyy-MM-dd");
                con.Open();

                MySqlCommand cmd = new MySqlCommand("insert into student_registration(first_name,last_name,dob,gender,email,phone_number,subject) values(@first_name,@last_name,@dob,@gender,@email,@phone_number,@subject)", con);
                cmd.Parameters.AddWithValue("@first_name", txtfname.Value );
                cmd.Parameters.AddWithValue("@last_name", txtlname.Value);
                cmd.Parameters.AddWithValue("@dob",dt);
                if (chkmale.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@gender",chkmale.Value );
                }
                else if (chkfemale.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@gender", chkfemale.Value);
                }
                else
                {
                    cmd.Parameters.Add("@gender", 0);
                }
                cmd.Parameters.AddWithValue("@email",txtmail.Value );
                cmd.Parameters.AddWithValue("@phone_number",txtmno.Value );
                cmd.Parameters.AddWithValue("@subject",sub.Value );
               
                cmd.ExecuteNonQuery();
                getStudent();
                con.Close();
            }
        }


        protected void btnUpdate_Click(object sender, EventArgs e)
        {
             string dob = string.Format("{0}", Request.Form["dob"]);
             DateTime date = Convert.ToDateTime(dob);
             string dt = date.ToString("yyyy-MM-dd");
           
            dbconnection db = new dbconnection();
            
            using(MySqlConnection con = new MySqlConnection(db.connstr))
            {

                con.Open();
                MySqlCommand cmd1 = new MySqlCommand("update student_registration set first_name='" + txtfname.Value + "',last_name='" + txtlname.Value + "',dob='" + dt + "',email='" + txtmail.Value + "',phone_number='" + txtmno.Value + "',subject='" + sub.Value + "' where first_name ='" + txtfname.Value + "'", con);
                if (chkmale.Checked == true)
                {
                    cmd1.Parameters.AddWithValue("@gender", chkmale.Value);
                }
                else if (chkfemale.Checked == true)
                {
                    cmd1.Parameters.AddWithValue("@gender", chkfemale.Value);
                }

                else
                {
                    cmd1.Parameters.Add("@gender", 0);
                }
                cmd1.ExecuteNonQuery();
                getStudent();
                con.Close();
            }

        }


        protected void btnDelete_Click(object sender , EventArgs e)
        {
            dbconnection db = new dbconnection();
            using (MySqlConnection con = new MySqlConnection(db.connstr))
            {
                con.Open();
                MySqlCommand cmd = new MySqlCommand("delete from student_registration where first_name ='" + txtfname.Value + "'", con);
                cmd.ExecuteNonQuery();
                getStudent();
                con.Close();
            }
        }



        private void getStudent()
        {
            dbconnection db = new dbconnection();
            using (MySqlConnection con = new MySqlConnection(db.connstr))
            {
                con.Open();
                MySqlCommand cmd = new MySqlCommand("select * from student_registration", con);
                DataSet ds = new DataSet();
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rptstudentdetail.DataSource = dt;
                rptstudentdetail.DataBind();
                con.Close();
            }
        }
        private int idstudent
        {
            get
            {
                return Convert.ToInt32(Request.QueryString["Id"]);
            }
        }


        protected void btnselect_Click(object sender, EventArgs e)
        {
            getData();
        }

        protected void getData()
        {
            dbconnection db = new dbconnection();
            using (MySqlConnection con = new MySqlConnection(db.connstr))
            {
                try
                {
                    con.Open();
                    MySqlCommand cmd = new MySqlCommand("select * from student_registration where id = '"+ hidfield.Value +"'" , con);
                    DataTable dt = new DataTable();
                    using (MySqlDataAdapter sda = new MySqlDataAdapter(cmd))
                    {
                        sda.Fill(dt);
                        if(dt.Rows.Count > 0)
                        {
                            lblId.Text = dt.Rows[0]["id"].ToString();
                            txtfname.Value = dt.Rows[0]["first_name"].ToString();
                            txtlname.Value = dt.Rows[0]["last_name"].ToString();
                            dob.Value = Convert.ToDateTime(dt.Rows[0]["dob"]).ToString("dd-MM-yyyy");
                            if (dt.Rows[0]["gender"].ToString() == "male")
                            {
                                chkmale.Checked = true;
                            }
                            else if (dt.Rows[0]["gender"].ToString() == "female")
                            {
                                chkfemale.Checked = true;
                            }

                            txtmail.Value = dt.Rows[0]["email"].ToString();
                            txtmno.Value = dt.Rows[0]["phone_number"].ToString();

                            sub.SelectedIndex = sub.Items.IndexOf(sub.Items.FindByValue(dt.Rows[0]["subject"].ToString()));

                        }
                        else
                        {
                            MessageBox.Show("No Data found");
                        }

                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
               // MessageBox.Show("ID= " + hidfield.Value);

            }


        }


    
        
    
    }

}