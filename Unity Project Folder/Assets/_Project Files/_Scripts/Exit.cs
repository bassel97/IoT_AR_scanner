using System.Collections;
using System.Collections.Generic;
using UnityEngine;

//Used to Exit the app
public class Exit : MonoBehaviour
{
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            Application.Quit();
        }
    }
}
