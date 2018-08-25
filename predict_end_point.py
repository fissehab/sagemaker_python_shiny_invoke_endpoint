
def predict_end_point(df):
  
    import numpy as np
    import pandas as pd
    import os
    
    # Define IAM role
    
    import boto3
    import re
    import sagemaker
    boto_session = boto3.Session(profile_name='',region_name='',aws_access_key_id =' ', aws_secret_access_key =' ' )
    sess = sagemaker.Session(boto_session=boto_session)
    endpoint_name = 'xgboost-biketrain-v1'
    predictor = sagemaker.predictor.RealTimePredictor(endpoint=endpoint_name,sagemaker_session=sess)
    from sagemaker.predictor import csv_serializer, json_deserializer
    predictor.content_type = 'text/csv'
    predictor.serializer = csv_serializer
    predictor.deserializer = None
    x  = predictor.predict(df)
    x = x.decode("utf-8")
    return x
