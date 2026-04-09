def convert(minutes):
    h = minutes // 60
    m = minutes % 60
    return f"{h} hrs {m} minutes"

print(convert(130))
