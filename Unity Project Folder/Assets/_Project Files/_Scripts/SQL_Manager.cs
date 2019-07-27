using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Networking;

public class SQL_Manager : MonoBehaviour
{

    #region Singleton

    static SQL_Manager instance;
    public void Awake()
    {
        if (instance == null)
            instance = this;
    }

    public static SQL_Manager GetInstance()
    {
        return instance;
    }

    #endregion

    IDatabaseClient currentClient;  //Buffer for the client being served as 

    public void GetDeviceDataShared(IDatabaseClient client, string device)
    {
        // Not to process two clients at same time
        if (currentClient != null)
            return;

        currentClient = client;

        StartCoroutine(PHP_Request(device));
    }

    IEnumerator PHP_Request(string deviceName)
    {
        WWWForm wwwForm = new WWWForm();

        wwwForm.AddField("Device", deviceName);     //Taken from Vuforia scan

        UnityWebRequest www = UnityWebRequest.Post("http://vuforia-project.000webhostapp.com/getDeviceDetails.php", wwwForm);   //This is where the php file stored

        yield return www.SendWebRequest();

        if (www.downloadHandler.text.Equals("error0"))
        {
            Debug.Log("error connecting to the data base");
        }
        else if (www.downloadHandler.text.Equals("error1"))
        {
            Debug.Log("error performing the query");
        }
        else
        {
            currentClient.GetClientString(www.downloadHandler.text);
        }

        www = UnityWebRequest.Post("http://vuforia-project.000webhostapp.com/getDeviceData.php", wwwForm);   //This is where the php file stored

        yield return www.SendWebRequest();

        if (www.downloadHandler.text.Equals("error0"))
        {
            Debug.Log("error connecting to the data base");
        }
        else if (www.downloadHandler.text.Equals("error1"))
        {
            Debug.Log("error performing the query");
        }
        else
        {
            string[] separators = { "\t" }; // same as in php file

            string[] texts = www.downloadHandler.text.Split(separators, System.StringSplitOptions.RemoveEmptyEntries);   //To remove last empty value

            currentClient.GetClientStringArray(texts);
        }

        currentClient = null;
    }

}
