module ApplicationHelper

  def hace_tanto_tiempo (from_time, to_time = 0, include_seconds = false, language = nil)
  # Traducción de distance_of_time_in_words

      from_time = from_time.to_time if from_time.respond_to? (:to_time)
      to_time = to_time.to_time if to_time.respond_to? (:to_time)
    #  distance_in_minutes = (((to_time.to_s.to_i) - (from_time.to_s.to_i))/60).round.abs
      distance_in_minutes = ((to_time.to_s.to_i - from_time.to_s.to_i)/60).abs.round
      distance_in_seconds = ((to_time.to_s.to_i) - (from_time.to_s.to_i)).abs.round

      case language || session[:language] || 'es'

        when 'es'
           say = {:less_seconds => 'menos de ? segundos', :half_minute => 'medio minuto', :less_minute => 'menos de un minuto', :minutes => 'minutos', :one_minute => 'un minuto', :hours => 'horas', :one_hour => 'una hora', :days => 'días', :one_day => 'un día',:months => 'meses', :one_month => 'un mes', :years => 'años', :one_year => 'un año'}
        when 'en'
           say = {:less_seconds => 'less than ? seconds', :half_minute => 'half a minute', :less_minute => 'lesss than a minute', :minutes => 'minutes', :one_minute => '1 minute', :hours => 'hours', :one_hour => 'about 1 hour', :days => 'days', :one_day => '1 day',:months => 'months', :one_month => 'about 1 month', :years => 'year', :one_year => 'about 1 year'}
      end

      case distance_in_minutes
        when 0..1
          return (distance_in_minutes==0) ? say[:less_minute] : say[:one_minute] unless include_seconds
          case distance_in_seconds
            when 0..4
              say[:less_seconds].sub(/\?/, '5')
            when 5..9
              say[:less_seconds].sub(/\?/, '10')
            when 10..19
              say[:less_seconds].sub(/\?/, '20')
            when 20..39
              say[:half_minute]
            when 40..59
              say[:less_minute]
            else
              say[:one_minute]
          end
        when 2..44
            "#{distance_in_minutes} #{say[:minutes]}"
        when 45..89
             say[:one_hour]
        when 90..1439
             "#{(distance_in_minutes.to_f / 60.0).round} #{say[:hours]}"
        when 1440..2879
             say[:one_day]
        when 2880..43199
             "#{(distance_in_minutes / 1440).round} #{say[:days]}"
        when 43200..86399
             say[:one_month]
        when 86400..525959
            "#{(distance_in_minutes / 43200).round} #{say[:months]}"
        when 525960..1051919
             say[:one_year]
        else
            "#{(distance_in_minutes / 525960).round} #{say[:years]}"
       end
  end

  def markdown(text)
    options = {
      filter_html:  true,
      hard_wrap:    true,
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true,
      fenced_code_blocks: true
    }

    extensions = {
      autolink:         true,
      superscript:      true,
      disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end
end
