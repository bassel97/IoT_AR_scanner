using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using Vuforia;

//Implements IDatabaseClient to get Event from database
public class ObjectVufSqlHandler : MonoBehaviour, IDatabaseClient
{

    bool dataSetFlag = false;

    string deviceName;      //To make sure data is not quered about twice

    [Header("UI Elements")]
    public Text deviceNameText;
    public Text deviceDetailsText;
    public Text deviceDataText;

    //Asks for the data from the SQL
    public void SetData()
    {
        if (dataSetFlag)
            return;

        SetName();

        SQL_Manager.GetInstance().GetDeviceDataShared(this,deviceName);
        
        dataSetFlag = true;
    }

    //Called from SqlManager when the query is done
    public void GetClientString(string responseString)
    {
        deviceDetailsText.text = responseString;
    }

    //Called from SqlManager when the query is done
    public void GetClientStringArray(string[] responseStringArray)
    {
        deviceDataText.text = "Data Shared:\n";
        for (int i = 0; i < responseStringArray.Length; i++)
        {
            deviceDataText.text += (i + 1)  + " - " + responseStringArray[i] + "\n";
        }
    }

    //Gets the name from Vuf data base
    public void SetName()
    {
        ImageTargetBehaviour imageTargetBehaviour = GetComponent<ImageTargetBehaviour>();

        deviceName = imageTargetBehaviour.ImageTarget.Name;
        
        deviceNameText.text = "IoT Device : " + deviceName + " Detected.";
    }

}
