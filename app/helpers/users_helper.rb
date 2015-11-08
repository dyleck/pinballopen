module UsersHelper
  def form_with_error_handling(name, &html)
     error = !@user.errors[name].empty?
     content_tag(:div, class: "form-group #{'form-group-no-margin-bottom' if error}") do
        content_tag(:div, class: nil) do
          res = [] << content_tag(:div, class: "input-group has-feedback #{'has-error' if error }") do
            res = []
            res << content_tag(:span, class: 'input-group-addon new-user-group-addon') do
              if name == :password_confirmation
                n = :confirm
              elsif name == :nationality_id
                n = :nationality
              else
                n = name
              end
              n.to_s.split(/_/).map {|t| t.capitalize }.join(" ")
            end
            res.append(yield html)
            if error
              res << content_tag(:span, class: 'form-control-feedback glyphicon glyphicon-remove') {}
            end
            res.join.html_safe
          end
          if error
            res << content_tag(:strong, @user.errors[name].first, class: 'help-block', style: 'color: red;')
          end
          res.join.html_safe
        end
      end
  end
end
