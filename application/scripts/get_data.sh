fileConfirmed=../src/assets/time_series_covid19_confirmed_global.csv
fileConfirmedNew=../src/assets/time_series_covid19_confirmed_global2.csv
urlConfirmed=https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv
if curl --output /dev/null --silent --head --fail "$urlConfirmed"; then
  curl -s $urlConfirmed >> $fileConfirmedNew
  if [[ -f "$fileConfirmed" ]]; then
    echo "$fileConfirmed exists."
	cmp --silent $fileConfirmed $fileConfirmedNew && echo '### SUCCESS: Files Are Identical! Ignoring!###' && rm $fileConfirmedNew || (echo '### WARNING: Files Are Different! ###' && mv $fileConfirmedNew $fileConfirmed)
  else 
    echo "$fileConfirmed does not exist."
	mv $fileConfirmedNew $fileConfirmed
  fi
else
  echo "URL does not exist: $urlConfirmed"
fi
# YES I am this lazy, I don't want to research how to create a function in bash
fileDeaths=../src/assets/time_series_covid19_deaths_global.csv
fileDeathsNew=../src/assets/time_series_covid19_deaths_global2.csv
urlDeaths=https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv
if curl --output /dev/null --silent --head --fail "$urlDeaths"; then
  curl -s $urlDeaths >> $fileDeathsNew
  if [[ -f "$fileDeaths" ]]; then
    echo "$fileDeaths exists."
	cmp --silent $fileDeaths $fileDeathsNew && echo '### SUCCESS: Files Are Identical! Ignoring! ###' && rm $fileDeathsNew || (echo '### WARNING: Files Are Different! ###' && mv $fileDeathsNew $fileDeaths)
  else 
    echo "$fileDeaths does not exist."
	mv $fileDeathsNew $fileDeaths
  fi
else
  echo "URL does not exist: $urlDeaths"
fi


fileRecovered=../src/assets/time_series_covid19_recovered_global.csv
fileRecoveredNew=../src/assets/time_series_covid19_recovered_global2.csv
urlRecovered=https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv
if curl --output /dev/null --silent --head --fail "$urlRecovered"; then
  curl -s $urlRecovered >> $fileRecoveredNew
  if [[ -f "$fileRecovered" ]]; then
    echo "$fileRecovered exists."
	cmp --silent $fileRecovered $fileRecoveredNew && echo '### SUCCESS: Files Are Identical! Ignoring!###' && rm $fileRecoveredNew || (echo '### WARNING: Files Are Different! ###' && mv $fileRecoveredNew $fileRecovered)
  else 
    echo "$fileRecovered does not exist."
	mv $fileRecoveredNew $fileRecovered
  fi
else
  echo "URL does not exist: $urlRecovered"
fi
