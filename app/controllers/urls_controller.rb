class UrlsController < ApplicationController
  def index
    list = Url.all.order({id: "asc"})
    ret = []
    list.each do |rec|
      new_rec = {name: rec.name, url: rec.url,wait:rec.wait}
      ret << new_rec
    end
    render json: ret
  end

  def access
    name = params[:name]
    wait = params[:wait].to_i
    message = ''
    if wait  == 0 || !wait  then
      sleep_time=0
      message = "・即時レスポンス。｛#{name} ｝"
    else
      sleep_time = wait
      message= "・#{wait.to_s}秒まってレスポンスします。｛#{name} ｝"
    end
    logger.debug("#{wait.to_s}秒待機します｛#{name} ｝")
    sleep(sleep_time)
    logger.debug("#{wait}秒待機しました")
    render json: {ret:'ok',msg:message}
  end
end
