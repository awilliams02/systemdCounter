import pytest
import datetime
import signal
import sys

def test_output_format():
    now = datetime.datetime(2025, 2, 23, 10, 13, 49)
    message = f"Alexa: {now.strftime('%Y-%m-%d %H:%M:%S')} #22209"
    assert message == f"Alexa: 2025-02-23 10:13:49 #22209"



