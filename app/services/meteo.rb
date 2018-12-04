require 'open_weather'

class Meteo

    def get_values(long, lat)
        options = { units: "degrees", APPID: "#{Rails.application.credentials.api_key_meteo}" }
        return OpenWeather::Current.geocode(long, lat, options)
    end

end
