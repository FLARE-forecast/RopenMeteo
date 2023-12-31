#' Get set of variables required for the GLM model

#' @param product api type: climate, forecast, ensemble_forecast, historical, seasonal_forecast
#' @param time_step model and time-step: hourly, 6hour, daily
#'
#' @return character vector
#' @export

glm_variables <- function(product, time_step){

  product_time_step <- paste0(product, "_", time_step)

  if(product_time_step %in% c("ensemble_forecast_hourly",
                              "forecast_hourly",
                              "historical_hourly")){

    glm_vars <- c("relativehumidity_2m",
      "precipitation",
      "windspeed_10m",
      "cloudcover",
      "temperature_2m",
      "shortwave_radiation",
      "surface_pressure")

    return(glm_vars)

    }else if(product_time_step %in% c("seasonal_forecast_6hourly")){

      glm_vars <- c("relativehumidity_2m",
                    "precipitation",
                    "windspeed_10m",
                    "cloudcover",
                    "temperature_2m",
                    "shortwave_radiation")

      return(glm_vars)

    }else if(product_time_step == "climate_projection_daily"){

      glm_vars <- c("temperature_2m_mean",
                    "windspeed_10m_mean",
                    "cloudcover_mean",
                    "shortwave_radiation_sum",
                    "relative_humidity_2m_mean",
                    "precipitation_sum")

    }else{
      stop(paste0(paste0(product, " ", time_step) ," GLM variables not supported yet"))

    }

}
