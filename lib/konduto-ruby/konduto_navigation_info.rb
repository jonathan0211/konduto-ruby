class KondutoNavigationInfo < KondutoBase
  attributes :session_time, :referrer, :time_site_1d, :new_accounts_1d, :password_resets_1d, :sales_declined_1d,\
             :sessions_1d, :time_since_last_sale, :time_site_7d, :time_per_page_7d, :new_accounts_7d, \
             :password_resets_7d, :checkout_count_7d, :sales_declined_7d, :sessions_7d
end
