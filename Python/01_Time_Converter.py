def convert_minutes(minutes):
    hrs = minutes // 60
    mins = minutes % 60

    if hrs > 0:
        return f"{hrs} hr{'s' if hrs > 1 else ''} {mins} minutes"
    return f"{mins} minutes"

# User input
minutes = int(input("Enter minutes: "))
print(convert_minutes(minutes))
