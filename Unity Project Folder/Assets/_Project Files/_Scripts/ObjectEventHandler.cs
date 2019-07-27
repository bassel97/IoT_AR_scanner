using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Vuforia;
using UnityEngine.Events;

public class ObjectEventHandler : DefaultTrackableEventHandler
{
    // Public Events

    public UnityEvent objectTrackingFoundEvent;

    public UnityEvent objectTrackingLostEvent;
    
    //================

    #region UNITY_MONOBEHAVIOUR_METHODS

    protected override void Start()
    {
        mTrackableBehaviour = GetComponent<TrackableBehaviour>();
        if (mTrackableBehaviour)
            mTrackableBehaviour.RegisterTrackableEventHandler(this);
    }

    protected override void OnDestroy()
    {
        if (mTrackableBehaviour)
            mTrackableBehaviour.UnregisterTrackableEventHandler(this);
    }

    #endregion // UNITY_MONOBEHAVIOUR_METHODS

    #region PROTECTED_METHODS

    protected override void OnTrackingFound()
    {
        base.OnTrackingFound();

        objectTrackingFoundEvent.Invoke();
    }
    
    protected override void OnTrackingLost()
    {
        base.OnTrackingLost();

        objectTrackingLostEvent.Invoke();
    }

    #endregion // PROTECTED_METHODS

}
