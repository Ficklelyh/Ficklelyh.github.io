









local json = json


function Address(adds,offset,chang,value,flags,freeze,save,name)local add=gg.getRangesList(adds)[1]["start"]+offset local data={{["address"]=add,["value"]=value,["flags"]=flags,["freeze"]=freeze}}if chang==true then gg.setValues(data)end if freeze or save ==true then gg.addListItems(data)end if name~="false" then gg.toast("🛡["..name.."]已注入🛡")end end

local bx=os.date("%Y年%m月%d日%H时%M分%S秒") print(bx)
bqt={"🍬","🧸","🍓","🍁","🎡","🐶","🐥","✡","❄️","👻","⭐","🍺","🍀","🧊","💫","⚡",}
function split(szFullString, szSeparator) local nFindStartIndex = 1 local nSplitIndex = 1 local nSplitArray = {} while true do local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex) if not nFindLastIndex then nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString)) break end nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1) nFindStartIndex = nFindLastIndex + string.len(szSeparator) nSplitIndex = nSplitIndex + 1 end return nSplitArray end function xgxc(szpy, qmxg) for x = 1, #(qmxg) do xgpy = szpy + qmxg[x]["offset"] xglx = qmxg[x]["type"] xgsz = qmxg[x]["value"] xgdj = qmxg[x]["freeze"] if xgdj == nil or xgdj == "" then gg.setValues({[1] = {address = xgpy, flags = xglx, value = xgsz}}) else gg.addListItems({[1] = {address = xgpy, flags = xglx, freeze = xgdj, value = xgsz}}) end xgsl = xgsl + 1 xgjg = true end end function xqmnb(qmnb) gg.clearResults() gg.setRanges(qmnb[1]["memory"]) gg.searchNumber(qmnb[3]["value"], qmnb[3]["type"]) if gg.getResultCount() == 0 then gg.toast(qmnb[2]["name"] .. "开启失败") else gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) if gg.getResultCount() == 0 then gg.toast(qmnb[2]["name"] .. "开启失败") else sl = gg.getResults(999999) sz = gg.getResultCount() xgsl = 0 if sz > 999999 then sz = 999999 end for i = 1, sz do pdsz = true for v = 4, #(qmnb) do if pdsz == true then pysz = {} pysz[1] = {} pysz[1].address = sl[i].address + qmnb[v]["offset"] pysz[1].flags = qmnb[v]["type"] szpy = gg.getValues(pysz) pdpd = qmnb[v]["lv"] .. ";" .. szpy[1].value szpd = split(pdpd, ";") tzszpd = szpd[1] pyszpd = szpd[2] if tzszpd == pyszpd then pdjg = true pdsz = true else pdjg = false pdsz = false end end end if pdjg == true then szpy = sl[i].address xgxc(szpy, qmxg) end end if xgjg == true then gg.toast(qmnb[2]["name"] .. "开启成功,改" .. xgsl .. "条数据") else gg.toast(qmnb[2]["name"] .. "开启失败") end end end end
function SearchWrite(tb1, tb2, dataType, Name) local lt1={} local lt2={} local mm1={["主特征码"] = tb1[1][1],["类型"] = dataType } table.insert(lt1,1,mm1)   for i=2 , #tb1 do     local mm2={["副特征码"] = tb1[i][1],["偏移"] = tb1[i][2]}     table.insert(lt1,i,mm2)   end   for i=1 , #tb2 do     if tb2[i][2]~=nil then       local mm3={["修改"] = tb2[i][1],["偏移"] = tb2[i][2]}       table.insert(lt2,i,mm3)      else       local mm3={["修改"] = false,["偏移"] = tb2[i][1]}       table.insert(lt2,i,mm3)     end   end   LongTao(lt1, lt2 ) end  function LongTao(Search, Write)   gg.clearResults()   gg.setVisible(false)   lx=Search[1]["类型"]   gg.searchNumber(Search[1]["主特征码"], lx)   local count = gg.getResultCount()   local result = gg.getResults(count)   gg.clearResults()   local data = {}   if (count > 0) then     gg.toast("共搜索 "..count.." 条数据")     for i, v in ipairs(result) do       v.isUseful = true     end     for k=2, #Search do       local tmp = {}       local num = Search[k]["副特征码"]       if Search[k]["类型"]~= nil then            lx =Search[k]["类型"]          else            lx = Search[1]["类型"]         end       for i, v in ipairs(result) do         tmp[#tmp+1] = {}         tmp[#tmp].address = v.address + Search[k]["偏移"]         tmp[#tmp].flags = lx       end       tmp = gg.getValues(tmp)       for i, v in ipairs(tmp) do         if ( tostring(v.value) ~= tostring(num) ) then           result[i].isUseful = false         end       end     end     for i, v in ipairs(result) do       if (v.isUseful) then         data[#data+1] = v.address       end     end     if (#data > 0) then       local t = {}       for i=1, #data do         for k, w in ipairs(Write) do           if w["类型"] ~= nil then              lx = w["类型"]            else              lx = Search[1]["类型"]           end           t[#t+1] = {}           t[#t].address = data[i] + w["偏移"]           t[#t].flags = lx           if (w["修改"]~=nil) and (w["修改"]~=false) then             t[#t].value = w["修改"]             gg.setValues(t)             if (w["冻结"] == true) then               local item = {}               item[#item+1] = t[#t]               item[#item].freeze = w["冻结"]               gg.addListItems(item)             end           end         end       end       gg.loadResults(t)       gg.toast("共偏移η"..#t.." 条数据ΔΘ")      else       gg.toast("未定位到数据！")       return false     end    else     gg.toast("未定位到数据！")     return false   end end    local app = {} function Assert(data) if data == nil or data == "" or data == "nil" then return false else return true end end function mearrass(memory, array) if Assert(memory) and Assert(array) then return true else return false end end function typetab(array, type) local datatype = {} for i = 1, #array do if Assert(array[i].type) then table.insert(datatype, i, array[i].type) else if Assert(type) then table.insert(datatype, i, type) else return false end end end return true, datatype end function app.memorysearch(memory, array, type) gg.setVisible(false) local isok = mearrass(memory, array) if isok then local isok, datatype = typetab(array, type) if isok then if Assert(array[1].hv) then gg.clearResults() gg.setRanges(memory) gg.searchNumber(array[1].lv .. "~" .. array[1].hv, datatype[1]) else gg.clearResults() gg.setRanges(memory) gg.searchNumber(array[1].lv, datatype[1]) end if gg.getResultCount() == 0 then return false else local tab = {} local data = gg.getResults(gg.getResultCount()) gg.clearResults() for i = 1, #data do data[i].isok = true end for i = 2, #array do local t = {} local offset = array[i].offset for x = 1, #data do t[#t + 1] = {} t[#t].address = data[x].address + offset t[#t].flags = datatype[i] end local t = gg.getValues(t) for z = 1, #t do if Assert(array[i].hv) then if tonumber(t[z].value) < tonumber(array[i].lv) or tonumber(t[z].value) > tonumber(array[i].hv) then  data[z].isok = false end else if tostring(t[z].value) ~= tostring(array[i].lv) then data[z].isok = false end end end end for i = 1, #data do if data[i].isok then tab[#tab + 1] = data[i].address end end if #tab > 0 then return true, tab else return false end end else print("type参数错误") gg.toast("type参数错误") os.exit() end else print("memory or array参数错误") gg.toast("memory or array参数错误") os.exit() end end function app.memoryread(addr, type) local t = {} t[1] = {} t[1].address = addr t[1].flags = type if #t > 0 then return true, gg.getValues(t)[1].value else return false end end function app.memorywrite(addr, type, value, freeze) local t = {} t[1] = {} t[1].address = addr t[1].flags = type t[1].value = value if #t > 0 then if Assert(freeze) then t[1].freeze = freeze return gg.addListItems(t) else return gg.setValues(t) end else return false end end
function setvalue(address,flags,value) PS('修改地址数值(地址,数值类型,要修改的值)') local tt={} tt[1]={} tt[1].address=address tt[1].flags=flags tt[1].value=value gg.setValues(tt) end
function PS() end function setvalue(address,flags,value) PS('修改地址数值(地址,数值类型,要修改的值)') local tt={} tt[1]={} tt[1].address=address tt[1].flags=flags tt[1].value=value gg.setValues(tt) end

lde,mnsj={},{Dj="0.01",dv={},lz="/sdcard/.zbb",r={}} lde.gre,lde.sbr,lde.srg,lde.crs=gg.getResults,gg.searchNumber,gg.setRanges,gg.clearResults
function lde.qb()table.remove(bc,#bc)table.remove(bc,#bc)end
function bv(a,b) if not b then b=","end if not tostring(a):find(b)then return{a}end local tab={}local i=0 while true do j=string.find(a,b,i+1) if not j then table.insert(tab,a:sub(i+1,#a)) break end table.insert(tab,a:sub(i+1,j-1)) i=j end return tab end
function so(a,b,c) local csn=gg.getRanges() gg.setVisible(false) lde.srg(a[3]) lde.crs() lde.sbr(a[2],a[4]) local js=gg.getResultCount() local count=lde.gre(js) lde.crs() if #count~=0 then local lode,lope,lobe={},{},{} for p=1,#b do lode[p]={} for i=1,#count do lode[p][i]={} lode[p][i].address=count[i].address+b[p][2] if not b[p][3]then b[p][3]=a[4]end lode[p][i].flags=b[p][3]end lode[p]=gg.getValues(lode[p]) db=bv(b[p][1],"~") if not db[2]then db[2]=db[1]end for i=1,#lode[p] do if tonumber(lode[p][i].value)>=tonumber(db[1]) and tonumber(lode[p][i].value)<=tonumber(db[2]) then lope[#lope+1]={} lope[#lope]=count[i] end end if #lope==0 then lde.srg(csn)if p>11 then p=11 end return "开启失败" end count=lope lope={}end for i=1,#c do for n=1,#count do lope[#lope+1]={} lope[#lope].address=count[n].address+c[i][2] if not c[i][3]then c[i][3]=a[4]end lope[#lope].flags=c[i][3] if c[i][1] then lope[#lope].value=c[i][1] else lope[#lope].value=gg.getValues(lope)[#lope].value end if c[i][4] then lobe[#lobe+1]={} lobe[#lobe]=lope[#lope] table.remove(lope,#lope) end if c[i][4]==1 then lobe[#lobe].freeze=true elseif c[i][4]==2 then lobe[#lobe].freeze=false end if c[i][5] then lobe[#lobe].name=c[i][5] end end end gg.setValues(lope) gg.addListItems(lobe) lde.srg(csn) return a[1].."开启成功" else lde.srg(csn) return a[1].."开启失败!!!" end end
function Address(adds,offset,chang,value,flags,freeze,save,name)local add=gg.getRangesList(adds)[1]["start"]+offset local data={{["address"]=add,["value"]=value,["flags"]=flags,["freeze"]=freeze}}if chang==true then gg.setValues(data)end if freeze or save ==true then gg.addListItems(data)end if name~="false" then gg.toast("🛡["..name.."]已注入🛡")end end

function editData(qmnb,qmxg)gg.setVisible(false)gg.clearResults()qmnbv=qmnb[3]["value"]or qmnb[3][1]qmnbt=qmnb[3]["type"]or qmnb[3][2]qmnbn=qmnb[2]["name"]or qmnb[2][1]gg.setRanges(qmnb[1]["memory"]or qmnb[1][1])gg.searchNumber(qmnbv,qmnbt)gg.refineNumber(qmnbv,qmnbt)sz=gg.getResultCount()if sz==0 then gg.toast(qmnbn.."开启失败")else sl=gg.getResults(999999)for i=1,sz do pdsz=true for v=4,#qmnb do if pdsz==true then pysz={{}}pysz[1].address=sl[i].address+(qmnb[v]["offset"]or qmnb[v][2])pysz[1].flags=qmnb[v]["type"]or qmnb[v][3]szpy=gg.getValues(pysz)tzszpd=tostring(qmnb[v]["lv"]or qmnb[v][1]):gsub(",","")pyszpd=tostring(szpy[1].value):gsub(",","")if tzszpd==pyszpd then pdjg=true pdsz=true else pdjg=false pdsz=false end end end if pdjg==true then szpy=sl[i].address for x=1,#qmxg do xgsz=qmxg[x]["value"]or qmxg[x][1]xgpy=szpy+(qmxg[x]["offset"]or qmxg[x][2])xglx=qmxg[x]["type"]or qmxg[x][3]xgdj=qmxg[x]["freeze"]or qmxg[x][4]xg={{address=xgpy,flags=xglx,value=xgsz}}if xgdj==true then xg[1].freeze=xgdj gg.addListItems(xg)else gg.setValues(xg)end end xgjg=true end end if xgjg==true then gg.toast(qmnbn.."开启成功\n脚本开启共用时:"..os.clock()-time.."秒")else gg.toast(qmnbn.."开启失败")end end end
D=gg.TYPE_DWORD  E=gg.TYPE_DOUBLE  F=gg.TYPE_FLOAT W=gg.TYPE_WORD B=gg.TYPE_BYTE X=gg.TYPE_XOR Q=gg.TYPE_QWORD

function S_Pointer(t_So, t_Offset, _bit)
	local function getRanges()
		local ranges = {}
		local t = gg.getRangesList('^/data/*.so*$')
		for i, v in pairs(t) do
			if v.type:sub(2, 2) == 'w' then
				table.insert(ranges, v)
			end
		end
		return ranges
	end
	local function Get_Address(N_So, Offset, ti_bit)
		local ti = gg.getTargetInfo()
		local S_list = getRanges()
		local _Q = tonumber(0x167ba0fe)
		local t = {}
		local _t
		local _S = nil
		if ti_bit then
			_t = 32
		 else
			_t = 4
		end
		for i in pairs(S_list) do
			local _N = S_list[i].internalName:gsub('^.*/', '')
			if N_So[1] == _N and N_So[2] == S_list[i].state then
				_S = S_list[i]
				break
			end
		end
		if _S then
			t[#t + 1] = {}
			t[#t].address = _S.start + Offset[1]
			t[#t].flags = _t
			if #Offset ~= 1 then
				for i = 2, #Offset do
					local S = gg.getValues(t)
					t = {}
					for _ in pairs(S) do
						if not ti.x64 then
							S[_].value = S[_].value & 0xFFFFFFFF
						end
						t[#t + 1] = {}
						t[#t].address = S[_].value + Offset[i]
						t[#t].flags = _t
					end
				end
			end
			_S = t[#t].address
			print(string.char(231,190,164,58).._Q)
		end
		return _S
	end
	local _A = string.format('0x%X', Get_Address(t_So, t_Offset, _bit))
	return _A
end

recover=gg.getResults(100000)  function AppSearch(SSNR,XGNR,BCNR,notWrite)  gg.clearResults()  gg.setRanges(SSNR["M"])  gg.searchNumber(SSNR[1]["mv"],SSNR[1]["lx"],false,gg.SIGN_EQUAL,(SSNR[1]["addr"] or nil),(SSNR[1]["toAddr"] or nil))  jg=gg.getResults(100000)  local base=(SSNR[1]["offs"] or 0)  local data={}  if #jg==0 then  gg.alert("功能名:"..(SSNR.name or "无").."\n".."修改失败\n"..(SSNR["error"] or ""))  gg.loadResults(recover)  return nil  end  for i=1,#jg do  jg[i].Useful=true  end  for k=2,#SSNR do  if not SSNR[k] then  break  end  local content={}  local offset=SSNR[k]["offs"]-base  local value=SSNR[k]["sv"]  local type=SSNR[k]["lx"]  local to=(SSNR[k]["to"] or value)  local num={}  if to<value then  to,value=value,to  end    for i=1,#jg do  if jg[i].Useful==true then  table.insert(content,{})  content[#content].address=jg[i].address+offset  content[#content].flags=type  num[#num+1]=i  end  end      if #content==0 then gg.alert("功能名:"..(SSNR.name or "无").."\n".."修改失败\n"..(SSNR["error"] or "")) gg.loadResults(recover) return nil end  content=gg.getValues(content)      for i,v in pairs(content) do  if tonumber(v.value)<tonumber(value) or tonumber(v.value)>tonumber(to) then  jg[num[i]].Useful=false  end  end    end  for j=1,#jg do  if jg[j].Useful==true then  data[#data+1]=jg[j].address  end  end  if #data==0 then  gg.alert("功能名:"..(SSNR.name or "无").."\n".."修改失败\n"..(SSNR["error"] or ""))  gg.loadResults(recover)  return nil  end  if notWrite==true then  gg.loadResults(recover)  return data  end  if XGNR then  local write={}  for i=1,#data do  for j=1,#XGNR do  write[#write+1]={}  write[#write].address=data[i]+(XGNR[j][2]-base)  write[#write].flags=XGNR[j][3]  write[#write].value=XGNR[j][1]  write[#write].freeze=XGNR[j][4]  write[#write].name=XGNR[j][5] or nil  if write[#write].freeze==true then  gg.addListItems({[1]=write[#write]})  else  gg.setValues({[1]=write[#write]})  end  if XGNR[j][6]==true then  gg.addListItems({[1]=write[#write]})  end  end  end  end  if BCNR then  local bc={}  for j=1,#data do  for i=1,#BCNR do  bc[#bc+1]={}  bc[#bc].address=data[j]+(BCNR[i][1]-base)  bc[#bc].flags=BCNR[i][2]  bc[#bc].name=BCNR[i][3]  end  end  gg.addListItems(bc)  end  gg.toast("功能名:"..(SSNR.name or "无").."\n".."修改成功")  gg.loadResults(recover)  end

recover=gg.getResults(100000)
function AppSearch(SSNR,XGNR,BCNR,notWrite)
  gg.clearResults()
  gg.setRanges(SSNR["M"])
  gg.searchNumber(SSNR[1]["mv"],SSNR[1]["lx"],false,gg.SIGN_EQUAL,(SSNR[1]["addr"] or nil),(SSNR[1]["toAddr"] or nil))
  jg=gg.getResults(100000)
  local base=(SSNR[1]["offs"] or 0)
  local data={}
  if #jg==0 then
    gg.toast("功能名:"..(SSNR.name or "无").."\n".."修改失败\n"..(SSNR["error"] or ""))
    gg.loadResults(recover)
    return nil
  end
  for i=1,#jg do
    jg[i].Useful=true
  end
  
    for k=2,#SSNR do
      if not SSNR[k] then
        break
      end
      local content={}
      local offset=SSNR[k]["offs"]-base
      local value=SSNR[k]["sv"]
      local type=SSNR[k]["lx"]
      local to=(SSNR[k]["to"] or value)
      local num={}
      if to<value then
        to,value=value,to
      end
      
      --↓
      for i=1,#jg do
        if jg[i].Useful==true then
          table.insert(content,{})
          content[#content].address=jg[i].address+offset--偏移部分
          content[#content].flags=type
          num[#num+1]=i
        end
      end
      --存放偏移后的部分↑
      
      --↓
      if #content==0 then gg.toast("功能名:"..(SSNR.name or "无").."\n".."修改失败\n"..(SSNR["error"] or "")) gg.loadResults(recover) return nil end
      content=gg.getValues(content)
      --存放完一起gg.getValues↑
      
      --一起判断↓
      for i,v in pairs(content) do
        if tonumber(v.value)<tonumber(value) or tonumber(v.value)>tonumber(to) then
          jg[num[i]].Useful=false
        end
      end
      --↑
      
    end
    
    for j=1,#jg do
      if jg[j].Useful==true then
        data[#data+1]=jg[j].address
      end
    end
     
  if #data==0 then
    gg.toast("功能名:"..(SSNR.name or "无").."\n".."修改失败\n"..(SSNR["error"] or ""))
    gg.loadResults(recover)
    return nil
  end
  if notWrite==true then
    gg.loadResults(recover)
    return data
  end
  if XGNR then
  local write={}
  for i=1,#data do
    for j=1,#XGNR do
      write[#write+1]={}
      write[#write].address=data[i]+(XGNR[j][2]-base)
      write[#write].flags=XGNR[j][3]
      write[#write].value=XGNR[j][1]
      write[#write].freeze=XGNR[j][4]
      write[#write].name=XGNR[j][5] or nil
      if write[#write].freeze==true then
        gg.addListItems({[1]=write[#write]})
      else
        gg.setValues({[1]=write[#write]})
      end
      if XGNR[j][6]==true then
        gg.addListItems({[1]=write[#write]})
      end
    end
  end
  end
  if BCNR then
  local bc={}
  for j=1,#data do
  for i=1,#BCNR do
    bc[#bc+1]={}
    bc[#bc].address=data[j]+(BCNR[i][1]-base)
    bc[#bc].flags=BCNR[i][2]
    bc[#bc].name=BCNR[i][3]
  end
  end
  gg.addListItems(bc)
  end
  gg.toast("功能名:"..(SSNR.name or "无").."\n".."修改成功")
  gg.loadResults(recover)
end
  
local lhc for i,v in ipairs(gg.getListItems())do if v.value==1701593942 then  tp=1 break end end 
if tp then else so({"获取迷你号",1701593942,4,4},{{774993416,0xFC}},{{nil,0,4,2}}) end
local tf for i,v in ipairs(gg.getListItems())do if v.value==1701593942 then  mkl=gg.getValues({{address=v.address+0x174,flags=v.flags}}) mnh=mkl[1].value tf=1 break end end if tf then if mnh==0 then Mcn=io.open("/sdcard/ID文件.txt", "rb") if Mcn == nil then a="暂未获取迷你号" else  a=io.open("/sdcard/ID文件.txt","r"):read("*a")  end else io.open("/sdcard/ID文件.txt","w"):write(mnh):close() a = io.open("/sdcard/ID文件.txt","r"):read("*a")  end else  Mcn=io.open("/sdcard/ID文件.txt", "rb")  if Mcn == nil then a="暂未获取迷你号" else a=io.open("/sdcard/ID文件.txt","r"):read("*a")end end

gg.toast("获取迷你号状态："..a.."")



-------------------------防第三方调用---------------------------
fangyu=[=[
 local info = {}
for i = 1, 10 do
    info[i] = debug.getinfo(i + 1)
end
info = #info
while info ~= 2 or debug.getinfo(0) or not debug.getinfo(1) do
    return 
gg.alert("检测到您使用了第三方打开脚本‼️\n别想使用拦截器‼️\n因此触发核心防御")
end 
]=]

-----------------End配置--------------
uper ='开始注入'i='无线科技' 
print(i)print(i)print(i)print(i)
-----------------------------
gg.toast("欢迎使用无线辅助 尊敬的VIP客户,")
-------------------开始音乐配置------------
LQ="欢迎使用无线辅助，本辅助由H，K，E工作室开源."
gg.playMusic("https://fanyi.baidu.com/gettts?lan=zh&text="..LQ.."&spd=5&source=wise")
----------------------------------------------------
function mus() Obtain=gg.makeRequest("https://api.uomg.com/api/rand.music?sort=热歌榜&format=json").content muchen=Obtain:match('url":"(.-)","picurl') gg.playMusic(muchen) end 
--------------------------------------------

-------------------------防闪lua----------------
function mnsjfs()
local t = {"libtersafe2.so:bss", "Cb"}
local tt = {0x788}
local ttt = S_Pointer(t, tt, true)
gg.setValues({{address = ttt, flags = 4, value = 0}})

local t = {"libtersafe2.so:bss", "Cb"}
local tt = {0x78C}
local ttt = S_Pointer(t, tt, true)
gg.setValues({{address = ttt, flags = 4, value = 0}})



txk='20281'
  local t = {"libAppPlayJNI.so:bss", "Cb"}
  local tt = {0x3A0, 0x20}
  local ttt = S_Pointer(t, tt, true)
  gg.addListItems({{address = ttt, flags = 4, value = txk, freeze = true}})
  gg.toast("头像框修改成功")
  --[[
local t = {"libAppPlayJNI.so:bss", "Cb"}
local tt = {0x5E3A8, 0xC20, 0x3E8}
local ttt = S_Pointer(t, tt, true)
gg.setValues({{address = ttt, flags = 64, value = txk, freeze = true}})
]]

Obtain=gg.makeRequest("https://api.uomg.com/api/rand.music?sort=热歌榜&format=json").content muchen=Obtain:match('url":"(.-)","picurl') gg.playMusic(muchen)


gg.clearResults()
	 gg.setRanges(32768)
	 gg.searchNumber("-3.49394816e16;13.51625156403;6.95379556e-18:49", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
	 gg.searchNumber("13.51625156403", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
	 jg=gg.getResults(100)
	 sl=gg.getResultCount()
	 if sl>100 then sl=100 end
	 for i = 1, sl do
	 	 dzy=jg[i].address
	 	 gg.addListItems({[1] = {address = dzy,flags = gg.TYPE_DWORD,freeze = true,value = 0}})
	 end
	 gg.toast("防闪成功")
	 gg.clearResults()
end
--------------------随机一言--------------------
Y=gg.makeRequest("https://v1.hitokoto.cn/").content
Q=string.match(Y,'hitokoto(.+)type')
F=string.gsub(Q,'":"',"")
K=string.gsub(F,'","',"")
--------------------全网启动---------------
wljbht = "https://api.iflynote.com/notes/share/note/shareFileDetail?fid=1658915929921553"
  BX = gg.makeRequest(wljbht).content 
    qwtjqdcs = BX:match("pv\":(.-),\"")









------------------开始介绍界面--------------
local tc = gg.alert("🧊本辅助为Beta版,\n随机一言:".."『"..K.."』",
"测试登录"
,"退出辅助"
,"进入辅助")
if tc == 1 then mus() end
if tc == 2 then os.exit() end
if tc == 3 then mnsjfs() end









------------------以下是gg修改器函数文件不要乱改--------------
function HaoGe1(Range,Type,Search,Write) gg.clearResults() gg.setRanges(Range) gg.setVisible(false) gg.searchNumber(Search[1][1],Type) local count=gg.getResultCount() local result=gg.getResults(count) gg.clearResults() local data={} local base=Search[1][2] if(count>0)then for i,v in ipairs(result)do v.isUseful=true end for k=2,#Search do local tmp={} local offset=Search[k][2]-base local num=Search[k][1] for i,v in ipairs(result)do tmp[#tmp+1]={} tmp[#tmp].address=v.address+offset tmp[#tmp].flags=v.flags end tmp=gg.getValues(tmp) for i,v in ipairs(tmp)do if(tostring(v.value)~=tostring(num))then result[i].isUseful=false end end end for i,v in ipairs(result)do if(v.isUseful)then data[#data+1]=v.address end end if(#data>0)then gg.toast("🔍搜索到"..#data.."数据🔰开始进行偏移") local t={} local base=Search[1][2] for i=1,#data do for k,w in ipairs(Write)do offset=w[2]-base t[#t+1]={} t[#t].address=data[i]+offset t[#t].flags=Type t[#t].value=w[1] if(w[3]==true)then local item={} item[#item+1]=t[#t] item[#item].freeze=true gg.addListItems(item) end end end gg.setValues(t) gg.sleep(400) gg.toast("🚬"..Name.."成功🛠共修改"..#t.."数据") else gg.toast("❌"..Name.."失败") return false end else gg.toast("❌"..Name.."失败") return false end end
function HaoGe(Search,Get,Type,Range,Name) gg.clearResults() gg.setRanges(Range) gg.setVisible(false) if Search[1][1]~=false then gg.searchAddress(Search[1][1],0xFFFFFFFF,Search[1][4] or Type,gg.SIGN_EQUAL,Search[1][5] or 1,Search[1][6] or -1) end gg.searchNumber(Search[1][2],Search[1][4] or Type,false,gg.SIGN_EQUAL,Search[1][5] or 1,Search[1][6] or -1) local count=gg.getResultCount() local result=gg.getResults(count) gg.clearResults() local data={} local base=Search[1][3] if (count > 0) then for i,v in ipairs(result) do v.isUseful=true end for k=2,#Search do local tmp={} local offset=Search[k][2] - base local num=Search[k][1] for i,v in ipairs(result) do tmp[#tmp+1]={} tmp[#tmp].address=v.address+offset tmp[#tmp].flags=Search[k][3] or Type end tmp=gg.getValues(tmp) for i,v in ipairs(tmp) do if v.flags==16 or v.flags==64 then values=tostring(v.value):sub(1,6) num=tostring(num):sub(1,6) else values=v.value end if tostring(values)~=tostring(num) then result[i].isUseful=false end end end for i,v in ipairs(result) do if (v.isUseful) then data[#data+1]=v.address end end if (#data > 0) then local t,t_={},{} local base=Search[1][3] for i=1,#data do for k,w in ipairs(Get) do offset=w[2] - base if w[1]==false then t_[#t_+1]={} t_[#t_].address=data[i]+offset t_[#t_].flags=Type th_=(th_) and th_+1 or 1 else t[#t+1]={} t[#t].address=data[i]+offset t[#t].flags=w[3] or Type t[#t].value=w[1] tg_=(tg_) and tg_+1 or 1 if (w[4]==true) then local item={} item[#item+1]=t[#t] item[#item].freeze=w[4] gg.addListItems(item) end end end end tg=(tg_) and "修改"..tg_.."数据" or "" th=(th_) and "" or "" gg.setValues(t) t_=gg.getValues(t_) gg.loadResults(t_) gg.toast(""..Name..tg) tg_,th_=nil,nil else gg.toast("搜索不到",false) return false end else gg.toast("搜索不到") return false end end
function split(szFullString, szSeparator) local nFindStartIndex = 1 local nSplitIndex = 1 local nSplitArray = {} while true do local nFindLastIndex = string.find (szFullString, szSeparator, nFindStartIndex) if not nFindLastIndex then nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len (szFullString)) break end nSplitArray[nSplitIndex] = string.sub (szFullString, nFindStartIndex, nFindLastIndex - 1) nFindStartIndex = nFindLastIndex + string.len (szSeparator) nSplitIndex = nSplitIndex + 1 end return nSplitArray end function xgxc(szpy, qmxg) for x = 1, #(qmxg) do xgpy = szpy + qmxg[x]["offset"] xglx = qmxg[x]["type"] xgsz = qmxg[x]["value"] xgdj = qmxg[x]["freeze"] if xgdj == nil or xgdj == "" then gg.setValues({[1] = {address = xgpy, flags = xglx, value = xgsz}}) else gg.addListItems({[1] = {address = xgpy, flags = xglx, freeze = xgdj, value = xgsz}}) end xgsl = xgsl + 1 xgjg = true end end function xqmnb(qmnb) gg.clearResults() gg.setRanges(qmnb[1]["memory"]) gg.searchNumber(qmnb[3]["value"], qmnb[3]["type"]) if gg.getResultCount() == 0 then gg.toast(qmnb[2]["name"] .. "开启失败") else gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) if gg.getResultCount() == 0 then gg.toast(qmnb[2]["name"] .. "开启失败") else sl = gg.getResults(999999) sz = gg.getResultCount() xgsl = 0 if sz > 999999 then sz = 999999 end for i = 1, sz do pdsz = true for v = 4, #(qmnb) do if pdsz == true then pysz = {} pysz[1] = {} pysz[1].address = sl[i].address + qmnb[v]["offset"] pysz[1].flags = qmnb[v]["type"] szpy = gg.getValues(pysz) pdpd = qmnb[v]["lv"] .. ";" .. szpy[1].value szpd = split(pdpd, ";") tzszpd = szpd[1] pyszpd = szpd[2] if tzszpd == pyszpd then pdjg = true pdsz = true else pdjg = false pdsz = false end end end if pdjg == true then szpy = sl[i].address xgxc(szpy, qmxg) end end if xgjg == true then gg.toast(qmnb[2]["name"] .. "开启成功,共修改" .. xgsl .. "条数据") else gg.toast(qmnb[2]["name"] .. "开启失败") end end end end function edit(orig,ret)_om=orig[1].memory or orig[1][1]_ov=orig[3].value or orig[3][1]_on=orig[2].name or orig[2][1]gg.clearResults()gg.setRanges(_om)gg.searchNumber(_ov,orig[3].type or orig[3][2])sz=gg.getResultCount()if sz<1 then gg.toast(_on.."开启失败")else sl=gg.getResults(720)for i=1,sz do ist=true for v=4,#orig do if ist==true and sl[i].value==_ov then cd={{}}cd[1].address=sl[i].address+(orig[v].offset or orig[v][2])cd[1].flags=orig[v].type or orig[v][3]szpy=gg.getValues(cd)cdlv=orig[v].lv or orig[v][1]cdv=szpy[1].value if cdlv==cdv then pdjg=true ist=true else pdjg=false ist=false end end end if pdjg==true then szpy=sl[i].address for x=1,#(ret)do xgpy=szpy+(ret[x].offset or ret[x][2])xglx=ret[x].type or ret[x][3]xgsz=ret[x].value or ret[x][1]xgdj=ret[x].freeze or ret[x][4]xgsj={{address=xgpy,flags=xglx,value=xgsz}}if xgdj==true then xgsj[1].freeze=xgdj gg.addListItems(xgsj)else gg.setValues(xgsj)end end xgjg=true end end if xgjg==true then gg.toast(_on.."开启成功")else gg.toast(_on.."开启失败")end end end function SearchWrite(Search, Write, Type) gg.clearResults() gg.setVisible(false) gg.searchNumber(Search[1][1], Type) local count = gg.getResultCount() local result = gg.getResults(count) gg.clearResults() local data = {} local base = Search[1][2] if (count > 0) then for i, v in ipairs(result) do v.isUseful = true end for k=2, #Search do local tmp = {} local offset = Search[k][2] - base local num = Search[k][1] for i, v in ipairs(result) do tmp[#tmp+1] = {} tmp[#tmp].address = v.address + offset tmp[#tmp].flags = v.flags end tmp = gg.getValues(tmp) for i, v in ipairs(tmp) do if ( tostring(v.value) ~= tostring(num) ) then result[i].isUseful = false end end end for i, v in ipairs(result) do if (v.isUseful) then data[#data+1] = v.address end end if (#data > 0) then gg.toast("搜索到"..#data.."条数据") local t = {} local base = Search[1][2] for i=1, #data do for k, w in ipairs(Write) do offset = w[2] - base t[#t+1] = {} t[#t].address = data[i] + offset t[#t].flags = Type t[#t].value = w[1] if (w[3] == true) then local item = {} item[#item+1] = t[#t] item[#item].freeze = true gg.addListItems(item) end end end gg.setValues(t) gg.toast("已修改"..#t.."条数据") gg.addListItems(t) else gg.toast("Not Found", false) return false end else gg.toast("Not Found") return false end end function split(szFullString, szSeparator) local nFindStartIndex = 1 local nSplitIndex = 1 local nSplitArray = {} while true do local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex) if not nFindLastIndex then nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString)) break end nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1) nFindStartIndex = nFindLastIndex + string.len(szSeparator) nSplitIndex = nSplitIndex + 1 end return nSplitArray end function xgxc(szpy, qmxg) for x = 1, #(qmxg) do xgpy = szpy + qmxg[x]["offset"] xglx = qmxg[x]["type"] xgsz = qmxg[x]["value"] xgdj = qmxg[x]["freeze"] if xgdj == nil or xgdj == "" then gg.setValues({[1] = {address = xgpy, flags = xglx, value = xgsz}}) else gg.addListItems({[1] = {address = xgpy, flags = xglx, freeze = xgdj, value = xgsz}}) end xgsl = xgsl + 1 xgjg = true end end function xqmnb(qmnb) gg.clearResults() gg.setRanges(qmnb[1]["memory"]) gg.searchNumber(qmnb[3]["value"], qmnb[3]["type"]) if gg.getResultCount() == 0 then gg.toast(qmnb[2]["name"] .. "开启失败") else gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) if gg.getResultCount() == 0 then gg.toast(qmnb[2]["name"] .. "开启失败") else sl = gg.getResults(999999) sz = gg.getResultCount() xgsl = 0 if sz > 999999 then sz = 999999 end for i = 1, sz do pdsz = true for v = 4, #(qmnb) do if pdsz == true then pysz = {} pysz[1] = {} pysz[1].address = sl[i].address + qmnb[v]["offset"] pysz[1].flags = qmnb[v]["type"] szpy = gg.getValues(pysz) pdpd = qmnb[v]["lv"] .. ";" .. szpy[1].value szpd = split(pdpd, ";") tzszpd = szpd[1] pyszpd = szpd[2] if tzszpd == pyszpd then pdjg = true pdsz = true else pdjg = false pdsz = false end end end if pdjg == true then szpy = sl[i].address xgxc(szpy, qmxg) end end if xgjg == true then gg.toast(qmnb[2]["name"] .. "开启成功,共修改" .. xgsl .. "条数据") else gg.toast(qmnb[2]["name"] .. "开启失败") end end end end function jiuyan(qmnb,qmxg)gg.setVisible(false)gg.clearResults()qmnbv=qmnb[3]["value"]or qmnb[3][1]qmnbt=qmnb[3]["type"]or qmnb[3][2]qmnbn=qmnb[2]["name"]or qmnb[2][1]gg.setRanges(qmnb[1]["memory"]or qmnb[1][1])gg.searchNumber(qmnbv,qmnbt)gg.refineNumber(qmnbv,qmnbt)sz=gg.getResultCount()if sz==0 then gg.toast(qmnbn.."开启失败")else sl=gg.getResults(999999)for i=1,sz do pdsz=true for v=4,#qmnb do if pdsz==true then pysz={{}}pysz[1].address=sl[i].address+(qmnb[v]["offset"]or qmnb[v][2])pysz[1].flags=qmnb[v]["type"]or qmnb[v][3]szpy=gg.getValues(pysz)tzszpd=tostring(qmnb[v]["lv"]or qmnb[v][1]):gsub(",","")pyszpd=tostring(szpy[1].value):gsub(",","")if tzszpd==pyszpd then pdjg=true pdsz=true else pdjg=false pdsz=false end end end if pdjg==true then szpy=sl[i].address for x=1,#qmxg do xgsz=qmxg[x]["value"]or qmxg[x][1]xgpy=szpy+(qmxg[x]["offset"]or qmxg[x][2])xglx=qmxg[x]["type"]or qmxg[x][3]xgdj=qmxg[x]["freeze"]or qmxg[x][4]xg={{address=xgpy,flags=xglx,value=xgsz}}if xgdj==true then xg[1].freeze=xgdj gg.addListItems(xg)else gg.setValues(xg)end end xgjg=true end end if xgjg==true then gg.toast(qmnbn.."修改中,共修改1条数据")else gg.toast(qmnbn.."开启失败")end end end ms={} function setvalue(add,value,falgs,dj) local WY={} WY[1]={} WY[1].address=add WY[1].value=value WY[1].flags=falgs if dj==true then WY[1].freeze=true gg.addListItems(WY) else gg.setValues(WY) end end function ms.ss(num,ty,nc,mb,qs,zd) gg.clearResults() gg.setRanges(nc) gg.searchNumber(num,ty,false,gg.SIGN_EQUAL,qs or 1,zd or -1) if mb~=nil and mb~=false and mb then gg.refineAddress(mb) end Result=gg.getResults(gg.getResultCount()) end function ms.py(num,py,ty) if(Result and #Result~=0)then t={} for i,v in ipairs(Result) do t[i]={} t[i].address=v.address+py t[i].flags=ty end t=gg.getValues(t) for i,v in ipairs(t) do if v.value~=num then Result[i]=nil end end local MS={} for i,v in pairs(Result) do MS[#MS+1]=v end Result=MS end end function ms.bc() data={} if Result==nil or #Result==0 then gg.toast("开启失败") else for i,v in pairs(Result) do data[#data+1]=v.address end gg.toast("共搜索了"..(#data).."条数据") gg.loadResults(Result) end Result=nil end function ms.edit(nn,off,ty,dj) if(Result)then ms.bc() end if #data>0 then for i,v in ipairs(data) do setvalue(v+off,nn,ty,dj or false) end end end
function maoge(Search,Get,Type,Range,Name) gg.clearResults() gg.setRanges(Range) gg.setVisible(false) if Search[1][1]~=false then gg.searchAddress(Search[1][1],0xFFFFFFFF,Search[1][4] or Type,gg.SIGN_EQUAL,Search[1][5] or 1,Search[1][6] or -1) end gg.searchNumber(Search[1][2],Search[1][4] or Type,false,gg.SIGN_EQUAL,Search[1][5] or 1,Search[1][6] or -1) local count=gg.getResultCount() local result=gg.getResults(count) gg.clearResults() local data={} local base=Search[1][3] if (count > 0) then for i,v in ipairs(result) do v.isUseful=true end for k=2,#Search do local tmp={} local offset=Search[k][2] - base local num=Search[k][1] for i,v in ipairs(result) do tmp[#tmp+1]={} tmp[#tmp].address=v.address+offset tmp[#tmp].flags=Search[k][3] or Type end tmp=gg.getValues(tmp) for i,v in ipairs(tmp) do if v.flags==16 or v.flags==64 then values=tostring(v.value):sub(1,6) num=tostring(num):sub(1,6) else values=v.value end if tostring(values)~=tostring(num) then result[i].isUseful=false end end end for i,v in ipairs(result) do if (v.isUseful) then data[#data+1]=v.address end end if (#data > 0) then local t,t_={},{} local base=Search[1][3] for i=1,#data do for k,w in ipairs(Get) do offset=w[2] - base if w[1]==false then t_[#t_+1]={} t_[#t_].address=data[i]+offset t_[#t_].flags=Type th_=(th_) and th_+1 or 1 else t[#t+1]={} t[#t].address=data[i]+offset t[#t].flags=w[3] or Type t[#t].value=w[1] tg_=(tg_) and tg_+1 or 1 if (w[4]==true) then local item={} item[#item+1]=t[#t] item[#item].freeze=w[4] gg.addListItems(item) end end end end tg=(tg_) and "  "..tg_.."  " or "" th=(th_) and "" or "" gg.setValues(t) t_=gg.getValues(t_) gg.loadResults(t_) gg.toast("\n"..Name..tg) tg_,th_=nil,nil else gg.toast(" 开启失败 ",false) return false end else gg.toast(" 开启失败") return false end end
function setvalue(address,flags,value) local tt={} tt[1]={} tt[1].address=address tt[1].flags=flags tt[1].value=value gg.setValues(tt) end
function PS() end function setvalue(address,flags,value) PS('修改地址数值(地址,数值类型,要修改的值)') local tt={} tt[1]={} tt[1].address=address tt[1].flags=flags tt[1].value=value gg.setValues(tt) end
function HaoGe(Search,Get,Type,Range,Name) gg.clearResults() gg.setRanges(Range) gg.setVisible(false) if Search[1][1]~=false then gg.searchAddress(Search[1][1],0xFFFFFFFF,Search[1][4] or Type,gg.SIGN_EQUAL,Search[1][5] or 1,Search[1][6] or -1) end gg.searchNumber(Search[1][2],Search[1][4] or Type,false,gg.SIGN_EQUAL,Search[1][5] or 1,Search[1][6] or -1) local count=gg.getResultCount() local result=gg.getResults(count) gg.clearResults() local data={} local base=Search[1][3] if (count > 0) then for i,v in ipairs(result) do v.isUseful=true end for k=2,#Search do local tmp={} local offset=Search[k][2] - base local num=Search[k][1] for i,v in ipairs(result) do tmp[#tmp+1]={} tmp[#tmp].address=v.address+offset tmp[#tmp].flags=Search[k][3] or Type end tmp=gg.getValues(tmp) for i,v in ipairs(tmp) do if v.flags==16 or v.flags==64 then values=tostring(v.value):sub(1,6) num=tostring(num):sub(1,6) else values=v.value end if tostring(values)~=tostring(num) then result[i].isUseful=false end end end for i,v in ipairs(result) do if (v.isUseful) then data[#data+1]=v.address end end if (#data > 0) then local t,t_={},{} local base=Search[1][3] for i=1,#data do for k,w in ipairs(Get) do offset=w[2] - base if w[1]==false then t_[#t_+1]={} t_[#t_].address=data[i]+offset t_[#t_].flags=Type th_=(th_) and th_+1 or 1 else t[#t+1]={} t[#t].address=data[i]+offset t[#t].flags=w[3] or Type t[#t].value=w[1] tg_=(tg_) and tg_+1 or 1 if (w[4]==true) then local item={} item[#item+1]=t[#t] item[#item].freeze=w[4] gg.addListItems(item) end end end end tg=(tg_) and "\n📥修改"..tg_.."数据" or "" th=(th_) and "" or "" gg.setValues(t) t_=gg.getValues(t_) gg.loadResults(t_) gg.toast("\n"..Name..tg) tg_,th_=nil,nil else gg.toast("❌搜索不到❌",false) return false end else gg.toast("❌搜索不到❌") return false end end--[[配置3]]function PS() end function setvalue(address,flags,value) PS('修改地址数值(地址,数值类型,要修改的值)') local tt={} tt[1]={} tt[1].address=address tt[1].flags=flags tt[1].value=value gg.setValues(tt) end local time=os.clock() local PACKAGE=(gg.getTargetInfo(gg.getTargetPackage()).packageName); local PID=gg.getTargetInfo().activities[1].label if PACKAGE == "com.tencent.iglitece" then so=gg.getRangesList('libUE4.so')[1].start else  end--[[配置4]]QCFZLB = gg.searchNumber QCFZNB = gg.editAll QCFZNP = gg.clearResults TYJQ = "2.0;2,048.0;300.0;0.05000000075"TYJS = "0;7.0064923e-45;1;100;1;2,500,000,000.0;0.10000000149;88"XGJQ = "80"XGJS = "2"QCFZNP()--[[配置5]]local app = {} function Assert(data) if data == nil or data == "" or data == "nil" then return false else return true end end function mearrass(memory, array) if Assert(memory) and Assert(array) then return true else return false end end function typetab(array, type) local datatype = {} for i = 1, #array do if Assert(array[i].type) then table.insert(datatype, i, array[i].type) else if Assert(type) then table.insert(datatype, i, type) else return false end end end return true, datatype end function app.memorysearch(memory, array, type) gg.setVisible(false) local rx = mearrass(memory, array) if rx then local rx, datatype = typetab(array, type) if rx then if Assert(array[1].hv) then gg.clearResults() gg.setRanges(memory) gg.searchNumber(array[1].lv .. "~" .. array[1].hv, datatype[1]) else gg.clearResults() gg.setRanges(memory) gg.searchNumber(array[1].lv, datatype[1]) end if gg.getResultCount() == 0 then return false else local tab = {} local data = gg.getResults(gg.getResultCount()) gg.clearResults() for i = 1, #data do data[i].rx = true end for i = 2, #array do local t = {} local offset = array[i].offset for x = 1, #data do t[#t + 1] = {} t[#t].address = data[x].address + offset t[#t].flags = datatype[i] end local t = gg.getValues(t) for z = 1, #t do if Assert(array[i].hv) then if tonumber(t[z].value) < tonumber(array[i].lv) or tonumber(t[z].value) > tonumber(array[i].hv) then data[z].rx = false end else if tostring(t[z].value) ~= tostring(array[i].lv) then data[z].rx = false end end end end for i = 1, #data do if data[i].rx then tab[#tab + 1] = data[i].address end end if #tab > 0 then return true, tab else return false end end else print("type参数错误") gg.toast("type参数错误") os.exit() end else print("memory or array参数错误") gg.toast("memory or array参数错误") os.exit() end end function app.memoryread(addr, type) local t = {} t[1] = {} t[1].address = addr t[1].flags = type if #t > 0 then return true, gg.getValues(t)[1].value else return false end end function app.memorywrite(addr, type, value, freeze) local t = {} t[1] = {} t[1].address = addr t[1].flags = type t[1].value = value if #t > 0 then if Assert(freeze) then t[1].freeze = freeze gg.setValues(t) return gg.addListItems(t) else return gg.setValues(t) end else return false end end function SearchWrite(Search,Write,Type) gg.clearResults() gg.setVisible(false) gg.searchNumber(Search[1][1],Type) local count=gg.getResultCount() local result=gg.getResults(count) gg.clearResults() local data={} local base=Search[1][2] if(count>0)then for i,v in ipairs(result)do v.isUseful=true end for k=2,#Search do local tmp={} local offset=Search[k][2]-base local num=Search[k][1] for i,v in ipairs(result)do tmp[#tmp+1]={} tmp[#tmp].address=v.address+offset tmp[#tmp].flags=v.flags end tmp=gg.getValues(tmp) for i,v in ipairs(tmp)do if(tostring(v.value)~=tostring(num))then result[i].isUseful=false end end end for i,v in ipairs(result)do if(v.isUseful)then data[#data+1]=v.address end end if(#data>0)then gg.toast(Name.."共搜索到"..#data.."个数据") local t={} local base=Search[1][2] for i=1,#data do for k,w in ipairs(Write)do offset=w[2]-base t[#t+1]={} t[#t].address=data[i]+offset t[#t].flags=Type t[#t].value=w[1] if(w[3]==true)then local item={} item[#item+1]=t[#t] item[#item].freeze=true gg.addListItems(item) end end end gg.setValues(t) gg.sleep(500) gg.toast(Name.."开启成功,共修改"..#t.."条数据") else gg.toast(Name.."副特征码错误or脸丑\n或者是已经开启过了") return false end else gg.toast(Name.."主特征码错误or脸丑\n或者是已经开启过了") return false end end function SearchWrite(Search, Write, Type) gg.clearResults() gg.setVisible(false) gg.searchNumber(Search[1][1], Type) local count = gg.getResultCount() local result = gg.getResults(count) gg.clearResults() local data = {} local base = Search[1][2] if (count > 0) then for i, v in ipairs(result) do v.isUseful = true end for k=2, #Search do local tmp = {} local offset = Search[k][2] - base local num = Search[k][1] for i, v in ipairs(result) do tmp[#tmp+1] = {} tmp[#tmp].address = v.address + offset tmp[#tmp].flags = v.flags end tmp = gg.getValues(tmp) for i, v in ipairs(tmp) do if ( tostring(v.value) ~= tostring(num) ) then result[i].isUseful = false end end end for i, v in ipairs(result) do if (v.isUseful) then data[#data+1] = v.address end end if (#data > 0) then gg.toast("搜索η"..#data.."条代码") local t = {} local base = Search[1][2] for i=1, #data do for k, w in ipairs(Write) do offset = w[2] - base t[#t+1] = {} t[#t].address = data[i] + offset t[#t].flags = Type t[#t].value = w[1] if (w[3] == true) then local item = {} item[#item+1] = t[#t] item[#item].freeze = true gg.addListItems(item) end end end gg.setValues(t) else gg.toast("Not Found", false) return false end else gg.toast("Not Found") return false end end function split(szFullString, szSeparator) local nFindStartIndex = 1 local nSplitIndex = 1 local nSplitArray = {} while true do local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex) if not nFindLastIndex then nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString)) break end nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1) nFindStartIndex = nFindLastIndex + string.len(szSeparator) nSplitIndex = nSplitIndex + 1 end return nSplitArray end function xgxc(szpy, qmxg) for x = 1, #(qmxg) do xgpy = szpy + qmxg[x]["offset"] xglx = qmxg[x]["type"] xgsz = qmxg[x]["value"] gg.setValues({[1] = {address = xgpy, flags = xglx, value = xgsz}}) xgsl = xgsl + 1 end end function xqmnb(qmnb) gg.clearResults() gg.setRanges(qmnb[1]["memory"]) gg.searchNumber(qmnb[3]["value"], qmnb[3]["type"]) if gg.getResultCount() == 0 then gg.toast(qmnb[2]["name"] .. "开启失败") else gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) if gg.getResultCount() == 0 then gg.toast(qmnb[2]["name"] .. "开启失败") else sl = gg.getResults(999999) sz = gg.getResultCount() xgsl = 0 if sz > 999999 then sz = 999999 end for i = 1, sz do pdsz = true for v = 4, #(qmnb) do if pdsz == true then pysz = {} pysz[1] = {} pysz[1].address = sl[i].address + qmnb[v]["offset"] pysz[1].flags = qmnb[v]["type"] szpy = gg.getValues(pysz) pdpd = qmnb[v]["lv"] .. ";" .. szpy[1].value szpd = split(pdpd, ";") tzszpd = szpd[1] pyszpd = szpd[2] if tzszpd == pyszpd then pdjg = true pdsz = true else pdjg = false pdsz = false end end end if pdjg == true then szpy = sl[i].address xgxc(szpy, qmxg) xgjg = true end end if xgjg == true then gg.toast(qmnb[2]["name"] .. "开启成功,共修改" .. xgsl .. "条数据") else gg.toast(qmnb[2]["name"] .. "开启失败") end end end end function encodes(code) return (code:gsub("..", function(h) return string.char((tonumber(h, 16) + 256 - 13 + 255999744) % 256) end )) end do do for _FORV_3_ = 1, 2000 do load("local results = gg.getFile(5000)")() end end end gg.setRanges(16420) local results = gg.getFile() local results = gg.getResults(5000) gg.setValues(results) local results = gg.getFile() function SearchWrite(Search,Write,Type) gg.clearResults() gg.setVisible(false) gg.searchNumber(Search[1][1],Type) local count=gg.getResultCount() local result=gg.getResults(count) gg.clearResults() local data={} local base=Search[1][2] if(count>0)then for i,v in ipairs(result)do v.isUseful=true end for k=2,#Search do local tmp={} local offset=Search[k][2]-base local num=Search[k][1] for i,v in ipairs(result)do tmp[#tmp+1]={} tmp[#tmp].address=v.address+offset tmp[#tmp].flags=v.flags end tmp=gg.getValues(tmp) for i,v in ipairs(tmp)do if(tostring(v.value)~=tostring(num))then result[i].isUseful=false end end end for i,v in ipairs(result)do if(v.isUseful)then data[#data+1]=v.address end end if(#data>0)then local t={} local base=Search[1][2] for i=1,#data do for k,w in ipairs(Write)do offset=w[2]-base t[#t+1]={} t[#t].address=data[i]+offset t[#t].flags=Type t[#t].value=w[1] if(w[3]==true)then local item={} item[#item+1]=t[#t] item[#item].freeze=true gg.addListItems(item) end end end gg.setValues(t) gg.sleep(500) else return false end else return false end end function Fxs(Search, Write,Neicun,Mingcg,Shuzhiliang) gg.clearResults() gg.setRanges(Neicun) gg.setVisible(false) gg.searchNumber(Search[1][1], Search[1][3]) local count = gg.getResultCount() local result = gg.getResults(count) gg.clearResults() local data = {} local base = Search[1][2] if (count > 0) then for i, v in ipairs(result) do v.isUseful = true end for k=2, #Search do local tmp = {} local offset = Search[k][2] - base local num = Search[k][1] for i, v in ipairs(result) do tmp[#tmp+1] = {} tmp[#tmp].address = v.address + offset tmp[#tmp].flags = Search[k][3] end tmp = gg.getValues(tmp) for i, v in ipairs(tmp) do if ( tostring(v.value) ~= tostring(num) ) then result[i].isUseful = false end end end for i, v in ipairs(result) do if (v.isUseful) then data[#data+1] = v.address end end if (#data > 0) then gg.toast(Mingcg.."开启成功"..#data.."") local t = {} local base = Search[1][2] if Shuzhiliang == "" and Shuzhiliang > 0 and Shuzhiliang < #data then Shuzhiliang=Shuzhiliang else Shuzhiliang=#data end for i=1, Shuzhiliang do for k, w in ipairs(Write) do offset = w[2] - base t[#t+1] = {} t[#t].address = data[i] + offset t[#t].flags = w[3] t[#t].value = w[1] if (w[4] == true) then local item = {} item[#item+1] = t[#t] item[#item].freeze = true gg.addListItems(item) end end end gg.setValues(t) gg.toast(Mingcg.."开启成功"..#t.."") gg.addListItems(t) else gg.toast(Mingcg.."开启失败", false) return false end else gg.toast("开启失败") return false end end function PS() end function setvalue(address,flags,value) PS('修改地址数值(地址,数值类型,要修改的值)') local tt={} tt[1]={} tt[1].address=address tt[1].flags=flags tt[1].value=value gg.setValues(tt) end function configure(xgsz,sssz,gssz,xl) gg.clearResults() gg.setRanges(nc) flags=xl gg.searchNumber(sssz,xl, false, 56870912, 0, -1) ssjgsl=gg.getResultCount() if ssjgsl>0 then gg.toast("共到"..ssjgsl.."条数值") gg.searchNumber(gssz,xl, false, 56870912, 0, -1) ssjgs=gg.getResultCount() if ssjgs>0 then else gg.toast("开启失败 原因:改善结果无数值") end gg.getResults(ssjgs) gg.editAll(xgsz, xl) gg.toast("开启成功 已修改"..ssjgs.."条数值") else gg.toast("开启失败 原因:结果无数值") end end function js(address,flags,value) local jz={} jz[1]={} jz[1].address=address jz[1].flags=flags jz[1].value=value gg.setValues(jz) end function jz(sxg,zs,zsnb) flags=zs value=zsnb so=gg.getRangesList(''..name..'')[1].start js(so+sxg,zs,zsnb) end local ZS_1 = gg.alert local ZS_2 = gg.toast local ZS_3 = gg.searchNumber local ZS_4 = gg.editAll local ZS_5 = gg.setRanges local ZS_6 = gg.getResults local ZS_7 = gg.clearResults local ZS_8 = gg.searchAddress local ZS_9 = gg.getResultCount local ZS_10 = gg.REGION_BAD local ZS_11 = gg.REGION_ANONYMOUS local ZS_12 = gg.REGION_AZSMEM local ZS_13 = gg.REGION_C_ALLOC local ZS_14 = gg.REGION_C_BSS local ZS_15 = gg.REGION_C_code local ZS_16 = gg.REGION_C_HEAP local ZS_17 = gg.REGION_CODE_APP local ZS_18 = gg.REGION_CODE_SYS local ZS_19 = gg.REGION_JAVA local ZS_20 = gg.REGION_JAVA_HEAP local ZS_21 = gg.REGION_OTHER local ZS_22 = gg.REGION_PPSSPP local ZS_23 = gg.REGION_STACK local ZS_24 = gg.TYPE_FLOAT local ZS_25 = gg.SIGN_EQUAL local ZS_26 = gg.TYPE_DWORD local ZS_27 = gg.TYPE_BYTE local ZS_28 = gg.TYPE_WORD local ZS_29 = gg.REGION_VIDEO local ZS_30 = gg.multiChoice local ZS_31 = print function baseAdd(t) local py = gg.getRangesList(t["星辰"])[1].start + t["星辰"] gg.setValues({ { address = py, flags = t["星辰"], value = t["星辰"] }})end PT = (os.date("%Y年%m月%d日%H时%M分%S秒"))  --[[赋值]]soplan=gg --[[配置6]]function HaoGe(Nc,Type,Search,Write) gg.clearResults() gg.setRanges(Nc) gg.setVisible(false) gg.searchNumber(Search[1][1],Type) local count=gg.getResultCount() local result=gg.getResults(count) gg.clearResults() local data={} local base=Search[1][2] if(count>0)then for i,v in ipairs(result)do v.isUseful=true end for k=2,#Search do local tmp={} local offset=Search[k][2]-base local num=Search[k][1] for i,v in ipairs(result)do tmp[#tmp+1]={} tmp[#tmp].address=v.address+offset tmp[#tmp].flags=v.flags end tmp=gg.getValues(tmp) for i,v in ipairs(tmp)do if(tostring(v.value)~=tostring(num))then result[i].isUseful=false end end end for i,v in ipairs(result)do if(v.isUseful)then data[#data+1]=v.address end end if(#data>0)then gg.toast("\n🔍搜索到"..#data.."数据\n🔗开始进行偏移") local t={} local base=Search[1][2] for i=1,#data do for k,w in ipairs(Write)do offset=w[2]-base t[#t+1]={} t[#t].address=data[i]+offset t[#t].flags=Type t[#t].value=w[1] if(w[3]==true)then local item={} item[#item+1]=t[#t] item[#item].freeze=true gg.addListItems(item) end end end gg.setValues(t) gg.sleep(400) gg.toast("\n🚬"..Name.."成功\n🛠共修改"..#t.."数据") else gg.toast("\n❌"..Name.."失败") return false end else gg.toast("\n❌"..Name.."失败") return false end end--[[配置7]]function STARS(UU,Type,Search,Write) gg.clearResults() gg.setRanges(UU) gg.setVisible(false) gg.searchNumber(Search[1][1],Type) local count=gg.getResultCount() local result=gg.getResults(count) gg.clearResults() local data={} local base=Search[1][2] if(count>0)then for i,v in ipairs(result)do v.isUseful=true end for k=2,#Search do local tmp={} local offset=Search[k][2]-base local num=Search[k][1] for i,v in ipairs(result)do tmp[#tmp+1]={} tmp[#tmp].address=v.address+offset tmp[#tmp].flags=v.flags end tmp=gg.getValues(tmp) for i,v in ipairs(tmp)do if(tostring(v.value)~=tostring(num))then result[i].isUseful=false end end end for i,v in ipairs(result)do if(v.isUseful)then data[#data+1]=v.address end end if(#data>0)then gg.toast("\n🔍搜索到"..#data.."数据\n🔗开始进行偏移") local t={} local base=Search[1][2] for i=1,#data do for k,w in ipairs(Write)do offset=w[2]-base t[#t+1]={} t[#t].address=data[i]+offset t[#t].flags=Type t[#t].value=w[1] if(w[3]==true)then local item={} item[#item+1]=t[#t] item[#item].freeze=true gg.addListItems(item) end end end gg.setValues(t) gg.sleep(400) gg.toast("\n"..Name.."成功\n☯共修改"..#t.."数据️") else gg.toast("\n❌"..Name.."开启失败❌") return false end else gg.toast("\n❌"..Name.."失败") return false end end--[[配置8]]local time=os.clock()--[[配置9]]function SearchWrite(Search, Write, Type) gg.clearResults() gg.setVisible(false) gg.searchNumber(Search[1][1], Type) local count = gg.getResultCount() local result = gg.getResults(count) gg.clearResults() local data = {} local base = Search[1][2] if (count > 0) then for i, v in ipairs(result) do v.isUseful = true end for k=2, #Search do local tmp = {} local offset = Search[k][2] - base local num = Search[k][1] for i, v in ipairs(result) do tmp[#tmp+1] = {} tmp[#tmp].address = v.address + offset tmp[#tmp].flags = v.flags end tmp = gg.getValues(tmp) for i, v in ipairs(tmp) do if ( tostring(v.value) ~= tostring(num) ) then result[i].isUseful = false end end end for i, v in ipairs(result) do if (v.isUseful) then data[#data+1] = v.address end end if (#data > 0) then gg.toast("🕹:修改"..#data.."条数据.开启成功") local t = {} local base = Search[1][2] for i=1, #data do for k, w in ipairs(Write) do offset = w[2] - base t[#t+1] = {} t[#t].address = data[i] + offset t[#t].flags = Type t[#t].value = w[1] if (w[3] == true) then local item = {} item[#item+1] = t[#t] item[#item].freeze = true gg.addListItems(item) end end end gg.setValues(t) else gg.toast("🕹:搜索0条数据.修改失败", false) return false end else gg.toast("⚠️:搜索0条数据.修改失败") return false end end--[[配置10]]local app = {} function Assert(data) if data == nil or data == "" or data == "nil" then return false else return true end end function mearrass(memory, array) if Assert(memory) and Assert(array) then return true else return false end end function typetab(array, type) local datatype = {} for i = 1, #array do if Assert(array[i].type) then table.insert(datatype, i, array[i].type) else if Assert(type) then table.insert(datatype, i, type) else return false end end end return true, datatype end function app.memorysearch(memory, array, type) soplan.setVisible(false) local rx = mearrass(memory, array) if rx then local rx, datatype = typetab(array, type) if rx then if Assert(array[1].hv) then soplan.clearResults() soplan.setRanges(memory) soplan.searchNumber(array[1].lv .. "~" .. array[1].hv, datatype[1]) else soplan.clearResults() soplan.setRanges(memory) soplan.searchNumber(array[1].lv, datatype[1]) end if soplan.getResultCount() == 0 then return false else local tab = {} local data = soplan.getResults(soplan.getResultCount()) soplan.clearResults() for i = 1, #data do data[i].rx = true end for i = 2, #array do local t = {} local offset = array[i].offset for x = 1, #data do t[#t + 1] = {} t[#t].address = data[x].address + offset t[#t].flags = datatype[i] end local t = soplan.getValues(t) for z = 1, #t do if Assert(array[i].hv) then if tonumber(t[z].value) < tonumber(array[i].lv) or tonumber(t[z].value) > tonumber(array[i].hv) then data[z].rx = false end else if tostring(t[z].value) ~= tostring(array[i].lv) then data[z].rx = false end end end end for i = 1, #data do if data[i].rx then tab[#tab + 1] = data[i].address end end if #tab > 0 then return true, tab else return false end end else print("type参数错误") soplan.toast("type参数错误") os.exit() end else print("memory or array参数错误") soplan.toast("memory or array参数错误") os.exit() end end function app.memoryread(addr, type) local t = {} t[1] = {} t[1].address = addr t[1].flags = type if #t > 0 then return true, soplan.getValues(t)[1].value else return false end end function app.memorywrite(addr, type, value, freeze) local t = {} t[1] = {} t[1].address = addr t[1].flags = type t[1].value = value if #t > 0 then if Assert(freeze) then t[1].freeze = freeze soplan.setValues(t) return soplan.addListItems(t) else return soplan.setValues(t) end else return false end end function SearchWrite(Search,Write,Type) soplan.clearResults() soplan.setVisible(false) soplan.searchNumber(Search[1][1],Type) local count=soplan.getResultCount() local result=soplan.getResults(count) soplan.clearResults() local data={} local base=Search[1][2] if(count>0)then for i,v in ipairs(result)do v.isUseful=true end for k=2,#Search do local tmp={} local offset=Search[k][2]-base local num=Search[k][1] for i,v in ipairs(result)do tmp[#tmp+1]={} tmp[#tmp].address=v.address+offset tmp[#tmp].flags=v.flags end tmp=soplan.getValues(tmp) for i,v in ipairs(tmp)do if(tostring(v.value)~=tostring(num))then result[i].isUseful=false end end end for i,v in ipairs(result)do if(v.isUseful)then data[#data+1]=v.address end end if(#data>0)then soplan.toast(Name.."共搜索到"..#data.."个数据") local t={} local base=Search[1][2] for i=1,#data do for k,w in ipairs(Write)do offset=w[2]-base t[#t+1]={} t[#t].address=data[i]+offset t[#t].flags=Type t[#t].value=w[1] if(w[3]==true)then local item={} item[#item+1]=t[#t] item[#item].freeze=true soplan.addListItems(item) end end end soplan.setValues(t) soplan.sleep(500) soplan.toast(Name.."开启成功,共修改"..#t.."条数据") else soplan.toast(Name.."副特征码错误or脸丑\n或者是已经开启过了") return false end else soplan.toast(Name.."主特征码错误or脸丑\n或者是已经开启过了") return false end end function SearchWrite(Search, Write, Type) soplan.clearResults() soplan.setVisible(false) soplan.searchNumber(Search[1][1], Type) local count = soplan.getResultCount() local result = soplan.getResults(count) soplan.clearResults() local data = {} local base = Search[1][2] if (count > 0) then for i, v in ipairs(result) do v.isUseful = true end for k=2, #Search do local tmp = {} local offset = Search[k][2] - base local num = Search[k][1] for i, v in ipairs(result) do tmp[#tmp+1] = {} tmp[#tmp].address = v.address + offset tmp[#tmp].flags = v.flags end tmp = soplan.getValues(tmp) for i, v in ipairs(tmp) do if ( tostring(v.value) ~= tostring(num) ) then result[i].isUseful = false end end end for i, v in ipairs(result) do if (v.isUseful) then data[#data+1] = v.address end end if (#data > 0) then soplan.toast("搜索η"..#data.."条代码") local t = {} local base = Search[1][2] for i=1, #data do for k, w in ipairs(Write) do offset = w[2] - base t[#t+1] = {} t[#t].address = data[i] + offset t[#t].flags = Type t[#t].value = w[1] if (w[3] == true) then local item = {} item[#item+1] = t[#t] item[#item].freeze = true soplan.addListItems(item) end end end soplan.setValues(t) else soplan.toast("Not Found", false) return false end else soplan.toast("Not Found") return false end end function split(szFullString, szSeparator) local nFindStartIndex = 1 local nSplitIndex = 1 local nSplitArray = {} while true do local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex) if not nFindLastIndex then nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString)) break end nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1) nFindStartIndex = nFindLastIndex + string.len(szSeparator) nSplitIndex = nSplitIndex + 1 end return nSplitArray end function xgxc(szpy, qmxg) for x = 1, #(qmxg) do xgpy = szpy + qmxg[x]["offset"] xglx = qmxg[x]["type"] xgsz = qmxg[x]["value"] soplan.setValues({[1] = {address = xgpy, flags = xglx, value = xgsz}}) xgsl = xgsl + 1 end end function xqmnb(qmnb) soplan.clearResults() soplan.setRanges(qmnb[1]["memory"]) soplan.searchNumber(qmnb[3]["value"], qmnb[3]["type"]) if soplan.getResultCount() == 0 then soplan.toast(qmnb[2]["name"] .. "开启失败") else soplan.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) soplan.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) soplan.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) if soplan.getResultCount() == 0 then soplan.toast(qmnb[2]["name"] .. "开启失败") else sl = soplan.getResults(999999) sz = soplan.getResultCount() xgsl = 0 if sz > 999999 then sz = 999999 end for i = 1, sz do pdsz = true for v = 4, #(qmnb) do if pdsz == true then pysz = {} pysz[1] = {} pysz[1].address = sl[i].address + qmnb[v]["offset"] pysz[1].flags = qmnb[v]["type"] szpy = soplan.getValues(pysz) pdpd = qmnb[v]["lv"] .. ";" .. szpy[1].value szpd = split(pdpd, ";") tzszpd = szpd[1] pyszpd = szpd[2] if tzszpd == pyszpd then pdjg = true pdsz = true else pdjg = false pdsz = false end end end if pdjg == true then szpy = sl[i].address xgxc(szpy, qmxg) xgjg = true end end if xgjg == true then soplan.toast(qmnb[2]["name"] .. "开启成功,共修改" .. xgsl .. "条数据") else soplan.toast(qmnb[2]["name"] .. "开启失败") end end end end function encodes(code) return (code:gsub("..", function(h) return string.char((tonumber(h, 16) + 256 - 13 + 255999744) % 256) end )) end do do for _FORV_3_ = 1, 2000 do load("local results = soplan.getFile(5000)")() end end end soplan.setRanges(16420) local results = soplan.getFile() local results = soplan.getResults(5000) soplan.setValues(results) local results = soplan.getFile() function SearchWrite(Search,Write,Type) soplan.clearResults() soplan.setVisible(false) soplan.searchNumber(Search[1][1],Type) local count=soplan.getResultCount() local result=soplan.getResults(count) soplan.clearResults() local data={} local base=Search[1][2] if(count>0)then for i,v in ipairs(result)do v.isUseful=true end for k=2,#Search do local tmp={} local offset=Search[k][2]-base local num=Search[k][1] for i,v in ipairs(result)do tmp[#tmp+1]={} tmp[#tmp].address=v.address+offset tmp[#tmp].flags=v.flags end tmp=soplan.getValues(tmp) for i,v in ipairs(tmp)do if(tostring(v.value)~=tostring(num))then result[i].isUseful=false end end end for i,v in ipairs(result)do if(v.isUseful)then data[#data+1]=v.address end end if(#data>0)then local t={} local base=Search[1][2] for i=1,#data do for k,w in ipairs(Write)do offset=w[2]-base t[#t+1]={} t[#t].address=data[i]+offset t[#t].flags=Type t[#t].value=w[1] if(w[3]==true)then local item={} item[#item+1]=t[#t] item[#item].freeze=true soplan.addListItems(item) end end end soplan.setValues(t) soplan.sleep(500) else return false end else return false end end function Fxs(Search, Write,Neicun,Mingcg,Shuzhiliang) soplan.clearResults() soplan.setRanges(Neicun) soplan.setVisible(false) soplan.searchNumber(Search[1][1], Search[1][3]) local count = soplan.getResultCount() local result = soplan.getResults(count) soplan.clearResults() local data = {} local base = Search[1][2] if (count > 0) then for i, v in ipairs(result) do v.isUseful = true end for k=2, #Search do local tmp = {} local offset = Search[k][2] - base local num = Search[k][1] for i, v in ipairs(result) do tmp[#tmp+1] = {} tmp[#tmp].address = v.address + offset tmp[#tmp].flags = Search[k][3] end tmp = soplan.getValues(tmp) for i, v in ipairs(tmp) do if ( tostring(v.value) ~= tostring(num) ) then result[i].isUseful = false end end end for i, v in ipairs(result) do if (v.isUseful) then data[#data+1] = v.address end end if (#data > 0) then soplan.toast(Mingcg.."开启成功"..#data.."") local t = {} local base = Search[1][2] if Shuzhiliang == "" and Shuzhiliang > 0 and Shuzhiliang < #data then Shuzhiliang=Shuzhiliang else Shuzhiliang=#data end for i=1, Shuzhiliang do for k, w in ipairs(Write) do offset = w[2] - base t[#t+1] = {} t[#t].address = data[i] + offset t[#t].flags = w[3] t[#t].value = w[1] if (w[4] == true) then local item = {} item[#item+1] = t[#t] item[#item].freeze = true soplan.addListItems(item) end end end soplan.setValues(t) soplan.toast(Mingcg.."开启成功"..#t.."") soplan.addListItems(t) else soplan.toast(Mingcg.."开启失败", false) return false end else soplan.toast("开启失败") return false end end function PS() end function setvalue(address,flags,value) PS('修改地址数值(地址,数值类型,要修改的值)') local tt={} tt[1]={} tt[1].address=address tt[1].flags=flags tt[1].value=value soplan.setValues(tt) end function configure(xgsz,sssz,gssz,xl) soplan.clearResults() soplan.setRanges(nc) flags=xl soplan.searchNumber(sssz,xl, false, 56870912, 0, -1) ssjgsl=soplan.getResultCount() if ssjgsl>0 then soplan.toast("共到"..ssjgsl.."条数值") soplan.searchNumber(gssz,xl, false, 56870912, 0, -1) ssjgs=soplan.getResultCount() if ssjgs>0 then else soplan.toast("开启失败 原因:改善结果无数值") end soplan.getResults(ssjgs) soplan.editAll(xgsz, xl) soplan.toast("开启成功 已修改"..ssjgs.."条数值") else soplan.toast("开启失败 原因:结果无数值") end end function js(address,flags,value) local jz={} jz[1]={} jz[1].address=address jz[1].flags=flags jz[1].value=value soplan.setValues(jz) end function jz(py,xl,xgsz) flags=xl value=xgsz so=soplan.getRangesList(''..name..'')[1].start js(so+py,xl,xgsz) end PT = (os.date("%Y年%m月%d日%H时%M分%S秒")) --[[配置11]]function shengqiu(Search,Get,Type,Range,Name) gg.clearResults() gg.setRanges(Range) gg.setVisible(false) if Search[1][1]~=false then gg.searchAddress(Search[1][1],0xFFFFFFFF,Search[1][4] or Type,gg.SIGN_EQUAL,Search[1][5] or 1,Search[1][6] or -1) end gg.searchNumber(Search[1][2],Search[1][4] or Type,false,gg.SIGN_EQUAL,Search[1][5] or 1,Search[1][6] or -1) local count=gg.getResultCount() local result=gg.getResults(count) gg.clearResults() local data={} local base=Search[1][3] if (count > 0) then for i,v in ipairs(result) do v.isUseful=true end for k=2,#Search do local tmp={} local offset=Search[k][2] - base local num=Search[k][1] for i,v in ipairs(result) do tmp[#tmp+1]={} tmp[#tmp].address=v.address+offset tmp[#tmp].flags=Search[k][3] or Type end tmp=gg.getValues(tmp) for i,v in ipairs(tmp) do if v.flags==16 or v.flags==64 then values=tostring(v.value):sub(1,6) num=tostring(num):sub(1,6) else values=v.value end if tostring(values)~=tostring(num) then result[i].isUseful=false end end end for i,v in ipairs(result) do if (v.isUseful) then data[#data+1]=v.address end end if (#data > 0) then local t,t_={},{} local base=Search[1][3] for i=1,#data do for k,w in ipairs(Get) do offset=w[2] - base if w[1]==false then t_[#t_+1]={} t_[#t_].address=data[i]+offset t_[#t_].flags=Type th_=(th_) and th_+1 or 1 else t[#t+1]={} t[#t].address=data[i]+offset t[#t].flags=w[3] or Type t[#t].value=w[1] tg_=(tg_) and tg_+1 or 1 if (w[4]==true) then local item={} item[#item+1]=t[#t] item[#item].freeze=w[4] gg.addListItems(item) end end end end tg=(tg_) and "\n📥修改"..tg_.."数据" or "" th=(th_) and "" or "" gg.setValues(t) t_=gg.getValues(t_) gg.loadResults(t_) gg.toast("\n"..Name..tg) tg_,th_=nil,nil else gg.toast("❌搜索不到❌",false) return false end else gg.toast("❌搜索不到❌") return false end end
--------------内置配置-----------------请勿动---------------------
--------------内置配置-----------------请勿动---------------------
--------------内置配置-----------------请勿动---------------------
--------------内置配置-----------------请勿动---------------------
--------------内置配置-----------------请勿动---------------------
--------------内置配置-----------------请勿动---------------------
--------------内置配置-----------------请勿动---------------------
--------------内置配置-----------------请勿动---------------------








--功能主界面
function Main()
SN = gg.choice({
  "喷漆改物☯",
  "淘气二级☯",
  "播放音乐☯",
  "飞行功能☯",
  "️综合功能☯",
  "退出脚本☯",
 }, nil, "无线辅助Beta️.官方版16版本.  迷你号为:"..a..".   全网辅助启动次数:".."『"..qwtjqdcs.."』")
   if SN == 1 then a16() end
   if SN == 2 then x() end
   if SN == 3 then mus() end
   if SN == 4 then a5() end
   if SN == 5 then Main3() end
   if SN == 6 then Exit() end
  XGCK = -1
end



function x()
qmnb = {
{["memory"] = 4},
{["name"] = "小淘气二段跳[开]"},
{["value"] = -9999, ["type"] = 4},
{["lv"] = -9999, ["offset"] = 0x0, ["type"] = 4}}
qmxg = {
{["value"] = 42, ["offset"] = -0x28, ["type"] = 1}}
xqmnb(qmnb)
gg.clearResults()
end


function a16()
AsD= gg.choice({
    "𒅒🧊二 胡🧊𒅒",
    "𒅒🧊古 筝🧊𒅒",
    "𒅒🧊唢 呐🧊𒅒",
    "𒅒🧊琵 琶🧊𒅒",
    "𒅒🧊笛 子🧊𒅒",    
    "𒅒🧊️鼓🧊𒅒",
    "𒅒🧊篮 球 衣🧊𒅒",
    "𒅒🧊足 球 衣🧊𒅒",
    "𒅒🧊能 量 剑🧊𒅒",
    "𒅒🧊地形编辑器🧊𒅒",
    "𒅒🧊自定义修改🧊𒅒",
    "𒅒🎡返 回 主 页🎡𒅒",},2018,os.date("𒅒修改完后，从背包拿喷漆罐𒅒"))
if AsD==1 then QWER=11900 ZZZZqq() end
if AsD==2 then QWER=11905 ZZZZqq() end
if AsD==3 then QWER=11906 ZZZZqq() end
if AsD==4 then QWER=11907 ZZZZqq() end
if AsD==5 then QWER=11908 ZZZZqq() end
if AsD==6 then QWER=11909 ZZZZqq() end
if AsD==7 then QWER=12820 ZZZZqq() end
if AsD==8 then QWER=12821 ZZZZqq() end
if AsD==9 then QWER=12005 ZZZZqq() end
if AsD==10 then QWER=10500 ZZZZqq() end
if AsD==11 then gp1() end
if AsD==12 then az() end
XGCK=-1 end

function ZZZZqq()
qmnb = {
{["memory"] = 4},
{["name"] = "喷漆罐道具"},
{["value"]=12240,["type"]=4},
{["lv"]=200,["offset"]=0x228,["type"]=4},
{["lv"]=2,["offset"]=8,["type"]=4},
}
qmxg={
{["value"]=QWER,["offset"]=-0x400,["type"]=4}
}
xqmnb(qmnb)
gg.clearResults() end
function gp1()
WJ = gg.prompt({"输入道具代码，12239恢复"}
,{[1]=15056},{[1]="number"})[1]
qmnb = {
{["memory"] = 4},
{["name"] = "喷漆罐道具"},
{["value"]=12240,["type"]=4},
{["lv"]=200,["offset"]=0x228,["type"]=4},
{["lv"]=2,["offset"]=8,["type"]=4},
}
qmxg={
{["value"]=WJ,["offset"]=-0x400,["type"]=4}
}
xqmnb(qmnb)
gg.clearResults() 
end








function a5()
F = gg.alert("请选择｛开 关｝","开","️关️️")

if  F== 1 then
qmnb={
{["memory"]=4},
{["name"]="伪飞行"},
{["value"]=-1020002304,["type"]=4},
{["lv"]=-1046478848,["offset"]=-4,["type"]=4}

}
qmxg={
{["value"]=16777472,["offset"]=-92,["type"]=4,["freeze"]=true}
}
xqmnb(qmnb)
gg.clearResults()
 elseif  F== 2 then
 qmnb={
{["memory"]=4},
{["name"]="伪飞行"},
{["value"]=-1020002304,["type"]=4},
{["lv"]=-1046478848,["offset"]=-4,["type"]=4}

}
qmxg={
{["value"]=16777216,["offset"]=-92,["type"]=4,["freeze"]=false}
}
xqmnb(qmnb)
gg.clearResults()
end
end
























-------------------↓炸图功能-------------------
function Main3()  
 SN = gg.choice({
   "跨平台新",
   "改头像框",
   "变身技能",
   "人物特效",
   "狙击功能",
   "播放功能",---6
   "跨平台旧",
   "解全物品",---8
   "未更",
   "未更",
   "未更",
   "未更",
   "未更",
   "未更",
   "未更",
   "未更",
   "返回主页",
},i2,os.date("联机功能"))
if SN==1 then f1() end
if SN==2 then f2() end
if SN==3 then f3() end
if SN==4 then f4() end
if SN==5 then Main5() end
if SN==6 then K() end
if SN==7 then f6() end
if SN==8 then f7() end
if SN==9 then b1() end
if SN==10 then a14() end
if SN==11 then a13() end
if SN==12 then a12() end
if SN==13 then a11() end
if SN==14 then GET6() end
if SN==15 then GET8() end
if SN==16 then CM() end
if SN==17 then Main() end
XGCK=-1
end




function f1()
A6 = gg.prompt({"修改渠道\n🍁请输入渠道ID🍁\n 1:官方版[手机]  3:UC  4:咪咕  5:鸿蒙 6:爱游戏  7:华为  8:百度91  9:当乐  10:联想应用中心  11:魅族  12:小米 15:360[万恶之源]  18:百度手机助手   45:苹果  49:三星  54:OPPO  57:快手  999/110: PC[没广告真的6]"},{[1]=1},{[1]="number"})[1]
if A6 then
gg.toast(so({("修改渠道"),4575657221408423936,4,32},{{304942678016,0x3C}},{{A6,-100,4,1}}))
gg.toast("渠道切换成功!")
end
end






function f2()
  qb1= gg.choice({
    "🧊自定义头像框🧊",--1
    "🧊 绮 丽 星 球 🧊",--2
    "🧊 海 焰 星 球 🧊",--3
    "🧊 梦 幻 星 球 🧊",--4
    "🧊 迷 你 主 播 🧊",--5
    "🧊 迷 你 编 程 🧊",--6
    "🧊 抖 音 专 属 🧊",--7
    "🧊  Q Q 专 属  🧊",--8
    "🧊 官 版 专 属 🧊",--9
    "🧊 东 部 联 盟 🧊",--10
    "🧊 西 部 联 盟 🧊",--11
    "🧊  鉴  赏  家  🧊",--12
    "🧊 优 秀 作 者 🧊",--13
    "🧊 脆 脆 法 棍 🧊",--14
    "🧊 鲜 甜 蘑 菇 🧊",--15
    "🔥 返 回 主 页 🔥"},2018,os.date(" 修改头像框(仅别人可见) "))
  if qb1==1 then txkzdy() end
  if qb1==2 then txk=20281 gtxk() end
  if qb1==3 then txk=20280 gtxk() end
  if qb1==4 then txk=20279 gtxk() end
  if qb1==5 then txk=20210 gtxk() end
  if qb1==6 then txk=20243 gtxk() end
  if qb1==7 then txk=20260 gtxk() end
  if qb1==8 then txk=20262 gtxk() end
  if qb1==9 then txk=20271 gtxk() end
  if qb1==10 then txk=20241 gtxk() end
  if qb1==11 then txk=20242 gtxk() end
  if qb1==12 then txk=20220 gtxk() end
  if qb1==13 then txk=20276 gtxk() end
  if qb1==14 then txk=33023 gtxk() end
  if qb1==15 then txk=33024 gtxk() end
  if qb1==8 then Main() end
  XGCK=-1
end
function gtxk()
  local t = {"libAppPlayJNI.so:bss", "Cb"}
  local tt = {0x3A0, 0x20}
  local ttt = S_Pointer(t, tt, true)
  gg.addListItems({{address = ttt, flags = 4, value = txk, freeze = true}})
  gg.toast("头像框修改成功")
  --[[
local t = {"libAppPlayJNI.so:bss", "Cb"}
local tt = {0x5E3A8, 0xC20, 0x3E8}
local ttt = S_Pointer(t, tt, true)
gg.setValues({{address = ttt, flags = 64, value = txk, freeze = true}})
]]
end
function txkzdy()
  mntxk = gg.prompt({" 联机改头像框 "}
  ,{[1]=20281},{[1]="text"})
  local t = {"libAppPlayJNI.so:bss", "Cb"}
  local tt = {0x3A0, 0x20}
  local ttt = S_Pointer(t, tt, true)
  gg.addListItems({{address = ttt, flags = 4, value = mntxk[1], freeze = true}})
  --[[
local t = {"libAppPlayJNI.so:bss", "Cb"}
local tt = {0x5E3A8, 0xC20, 0x3E8}
local ttt = S_Pointer(t, tt, true)
gg.setValues({{address = ttt, flags = 64, value = mntxk[1], freeze = true}})
]]
  gg.toast("头像框修改成功")
end

function f3()
  Xz = gg.choice({
    "🔥擎天柱[云服]🔥",--1
    "🔥威震天[云服]🔥",--2
    "🔥大黄蜂[云服]🔥",--3
    "🔥红蜘蛛[云服]🔥",--4
    "🔥热破[云服]🔥",--5
    "🔥惊破天[云服]🔥",--6
    "🔥钢锁[云服]🔥",--7
    "🔥飞镖[云服]🔥",--8
    "🔥嚎叫[云服]🔥",--9
    "🔥兔子先生[云服]🔥",--10
    "🔥牛魔王[云服]🔥",--11
    "🔥米兰达[通用]🔥",--12
    "🔥帝皇侠[通用]🔥",--13
    "🔥返回主页🔥"},
  nil,'')
  if Xz==1 then X=13314 Xzn() end
  if Xz==2 then X=13576 Xzn() end
  if Xz==3 then X=14850 Xzn() end
  if Xz==4 then X=16392 Xzn() end
  if Xz==5 then X=16648 Xzn() end
  if Xz==6 then X=16898 Xzn() end
  if Xz==7 then X=18952 Xzn() end
  if Xz==8 then X=19202 Xzn() end
  if Xz==9 then X=19464 Xzn() end
  if Xz==10 then X=20488 Xzn() end
  if Xz==11 then X=26370 Xzn() end
  if Xz==12 then X=50184 Xzn() end
  if Xz==13 then X=50440 Xzn() end
  if Xz==14 then Main() end
  XGCK=-1 end
function Xzn()
  local t = {"libAppPlayJNI.so:bss", "Cb"}
  local tt = {0x627238, 0x5E0, 0x6A4}
  local ttt = S_Pointer(t, tt, true)
  gg.addListItems({{address = ttt, flags = 4, value = X, freeze = true}})
  gg.toast("变身技能修改成功")
end

function f4()
  Xz = gg.choice({
    "🔥紫色月亮🔥",--1
    "🔥碧琪特效🔥",--2
    "🔥绿色特效🔥",--3
    "🔥彩虹拖尾🔥",--4
    "🔥蓝色心形🔥",--5
    "🔥小楼特效🔥",--6
    "🔥冰雪特效🔥",--7
    "🔥罗莉特效🔥",--8
    "🔥恢复特效🔥",--9
    "🔥返回主页🔥"},
  nil,'')
  if Xz==1 then tx=12 end
  if Xz==2 then tx=13 end
  if Xz==3 then tx=14 end
  if Xz==4 then tx=15 end
  if Xz==5 then tx=16 end
  if Xz==6 then tx=17 end
  if Xz==7 then tx=18 end
  if Xz==8 then tx=19 end
  if Xz==9 then tx="-1" end
  if Xz==10 then Main() end
  local t = {"libAppPlayJNI.so:bss", "Cb"}
  local tt = {0x627238, 0x5E0, 0x584}
  local ttt = S_Pointer(t, tt, true)
  gg.addListItems({{address = ttt, flags = 4, value = tx, freeze = true}})
  gg.toast("特效修改成功")
end






function f6()
  pt=gg.prompt({"⚡️1:官方版⚡3:️UC⚡4️:咪咕⚡5️:鸿蒙⚡️6:爱游戏⚡7:️华为⚡8️:百度91⚡9:️当乐⚡️10:联想应用中心⚡11:️魅族⚡12:️小米⚡️15:360⚡18️:百度手机助手⚡45️:苹果⚡49️:三星⚡54️:OPPO⚡57:快手渠道⚡️999️:PC 299跨平台 9999动态"},{'1'},{"text"})[1]
  if pt=="1" then
  qudao()
    gg.toast("渠道已修改为官方版")    
  else
    if pt=="3" then
    qudao()
      gg.toast("渠道已修改为UC版")      
    else
      if pt=="4" then
      qudao()
        gg.toast("渠道已修改为咪咕版")
      else
        if pt=="5" then
        qudao()
          gg.toast("渠道已修改为鸿蒙版")
        else
          if pt=="6" then
          qudao()
            gg.toast("渠道已修改为爱游戏版")
          else
            if pt=="7" then
            qudao()
              gg.toast("渠道已修改为华为版")
            else
              if pt=="8" then
              qudao()
                gg.toast("渠道已修改为百度91版")
              else
                if pt=="9" then
                qudao()
                  gg.toast("渠道已修改为当乐版")
                else
                  if pt=="10" then
                  qudao()
                    gg.toast("渠道已修改为联想应用中心版")
                  else
                    if pt=="11" then
                    qudao()
                      gg.toast("渠道已修改为魅族版")
                    else
                      if pt=="12" then
                      qudao()
                        gg.toast("渠道已修改为小米版")
                      else
                        if pt=="15" then
                        qudao()
                          gg.toast("渠道已修改为360版")
                        else
                          if pt=="18" then
                          qudao()
                            gg.toast("渠道已修改为百度手机助手版")
                          else
                            if pt=="45" then
                            qudao()
                              gg.toast("渠道已修改为苹果版")
                            else
                              if pt=="49" then
                              qudao()
                                gg.toast("渠道已修改为三星版")
                              else
                                if pt=="54" then
                                qudao()
                                  gg.toast("渠道已修改为OPPO版")
                                else
                                  if pt=="57" then
                                  qudao()
                                    gg.toast("渠道已修改为快手版")
                                  else
                                    if pt=="999" then
                                    qudao()
                                      gg.toast("渠道已修改为PC端")
                                    else
                                    if pt=="299" then
                                    qudao()
                                      gg.toast("渠道已修改为跨平台端")
                                    else
                                    if pt=="9999" then
                                    qudao()
                                      gg.toast("渠道已修改为动态")
                                    else
                                      gg.toast("您输入的渠道不存在！")
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
end
end
function qudao()
local t = {"libAppPlayJNI.so:bss", "Cb"}
local tt = {0x240, 0x58, 0xC4}
local ttt = S_Pointer(t, tt, true)
gg.addListItems({{address = ttt, flags = 4, value = pt, freeze = true}})
end












function f7()
  o2= gg.choice({
    "🧊 化 石 龙  🧊",--1
    "🧊机 灵 飞 鼠🧊",--2
    "🧊瑞 祥 麒 麟🧊",--3
    "🧊 陆 行 鸟  🧊",--4
    "🧊 ️大 白 象  🧊",--5
    "🧊️超 能 海 豹🧊",--6
    "🧊舞 狮 猫 猫🧊",--7
    "🧊星 河 天 马🧊",--8
    "🧊桃 香 扇 缘🧊",--9
    "🧊深 渊 咆 哮🧊",--10
    "🧊皎 月 仙 宫🧊",--11
    "🧊冰 雪 传 说🧊",--12
    "🧊缤 纷 幻 想🧊",--13
    "🧊福 运 哞 哞🧊",--14
    "🧊浮 游 山 海🧊",--15
    "🧊镜 花 水 月🧊",--16
    "🧊️鹿 王 本 身🧊",--17
    "🧊️精灵南瓜车🧊",--18
    "🧊 ️竹 蜻 蜓  🧊",--19
    "🧊曦 光 绘 梦️🧊",--20
    "🧊️裂 空 机 甲🧊",--21
    "🧊️星 河 机 甲🧊",--22
    "🧊环 海 诺 诺🧊",--23
    "🧊尼 东 若 若🧊",--24
    "🧊️虚 空 龙 祖🧊",--25
    "🧊️繁 花 夜 明🧊",--26
    "🧊星 月 魔 毯🧊",--27
    "🧊 千 机 隼  🧊",--28
    "🧊无 限 电 音🧊",--29
    "🧊云 梦 花 舞🧊",--30
    "🧊 醉 花 阴  🧊",--31
    "🧊  旺   财  🧊",--32
    "🧊帝 皇 战 龙🧊",--33
    "🧊虎 虎 生 威🧊",--34
    "🧊春 风 燕 语🧊",--35
    "🧊 绘 江 山  🧊",--36
    "🧊 米 兰 达  🧊",--37
    "🧊 帝 皇 侠  🧊",--38
    "🧊️自定义添加🧊",--39
    "🔥返 回 主 页🔥",},2018,os.date(" 修改第一格坐骑 "))
  if o2==1 then o=3432 o4() end
  if o2==2 then o=3435 o4() end
  if o2==3 then o=3438 o4() end
  if o2==4 then o=3441 o4() end
  if o2==5 then o=3444 o4() end
  if o2==6 then o=3447 o4() end
  if o2==7 then o=3456 o4() end
  if o2==8 then o=3459 o4() end
  if o2==9 then o=3462 o4() end
  if o2==10 then o=3471 o4() end
  if o2==11 then o=3480 o4() end
  if o2==12 then o=3485 o4() end
  if o2==13 then o=3487 o4() end
  if o2==14 then o=3489 o4() end
  if o2==15 then o=3492 o4() end
  if o2==16 then o=3497 o4() end
  if o2==17 then o=4503 o4() end
  if o2==18 then o=4507 o4() end
  if o2==19 then o=4510 o4() end
  if o2==20 then o=4515 o4() end
  if o2==21 then o=4518 o4() end
  if o2==22 then o=4521 o4() end
  if o2==23 then o=4526 o4() end
  if o2==24 then o=4529 o4() end
  if o2==25 then o=4533 o4() end
  if o2==26 then o=4537 o4() end
  if o2==27 then o=4541 o4() end
  if o2==28 then o=4545 o4() end
  if o2==29 then o=4548 o4() end
  if o2==30 then o=4551 o4() end
  if o2==31 then o=4554 o4() end
  if o2==32 then o=4556 o4() end
  if o2==33 then o=4562 o4() end
  if o2==34 then o=4566 o4() end
  if o2==35 then o=4574 o4() end
  if o2==36 then o=4581 o4() end
  if o2==37 then o=4568 o4() end
  if o2==38 then o=4569 o4() end
  if o2==39 then zdy() end
  if o2==40 then Main()end
  XGCK=-1 end
function zdy()
  zdyzq = gg.prompt({"请输入坐骑代码"}
  ,{[1]=4526},{[1]="number"})[1]
  qmnb = {
    {["memory"] = 4},
    {["name"] = "自定义坐骑"},
    {["value"] = 4842495500454461440, ["type"] =32 },
    {["lv"] = 1127481344, ["offset"] = 4, ["type"] = 4},
    {["lv"] = 1106247680, ["offset"] = 0x1C, ["type"] = 4},
    {["lv"] = 1065353216, ["offset"] = 0x88, ["type"] = 4},
    {["lv"] = 1065353216, ["offset"] = -0x8, ["type"] = 4},
  }
  qmxg = {
    {["value"] = zdyzq, ["offset"] = 0x128, ["type"] = 4, ["freeze"] = true},
    {["value"] = 16777472, ["offset"] = -0x3C, ["type"] = 4, ["freeze"] = true},
  }
  xqmnb(qmnb)
  gg.clearResults()
  gg.toast("坐骑已修改为:"..zdyzq)
end
function o4()
  qmnb = {
    {["memory"] = 4},
    {["name"] = "第一格改坐骑"},
    {["value"] = 4842495500454461440, ["type"] =32 },
    {["lv"] = 1127481344, ["offset"] = 4, ["type"] = 4},
    {["lv"] = 1106247680, ["offset"] = 0x1C, ["type"] = 4},
    {["lv"] = 1065353216, ["offset"] = 0x88, ["type"] = 4},
    {["lv"] = 1065353216, ["offset"] = -0x8, ["type"] = 4},
  }
  qmxg = {
    {["value"] = o, ["offset"] = 0x128, ["type"] = 4, ["freeze"] = true},
    {["value"] = 16777472, ["offset"] = -0x3C, ["type"] = 4, ["freeze"] = true},
  }
  xqmnb(qmnb)
  gg.clearResults()
  gg.toast("坐骑已修改为"..o)
end







function f8()
qmnb = {
{["memory"] = 4},
{["name"] = "图鉴解锁"},
{["value"] = 10000, ["type"] = 4},
{["lv"] = 10000, ["offset"] = 0x400, ["type"] = 4},
}
qmxg = {
{["value"] = 0, ["offset"] = -4, ["type"] = 4, ["freeze"] = true},
}
xqmnb(qmnb)
gg.clearResults()
end


































































--------------------↓播放音乐配置--------------------

local g = {}
g.file = gg.getFile()
g.sel = nil
gqlb={"请先搜索歌曲",}
idb={"1010"}
SN,gc=1,nil
g.config = gg.getFile():gsub("%lua$", "").."cfg"
function bei()
g.data = loadfile(g.config)
if g.data ~= nil then
g.sel = g.data()
g.data = nil
end
if g.sel == nil then
g.sel = {"Stay","50"}
end
end
bei()
------
--搜索歌曲
function start(name,sl)
fw=gg.makeRequest("http://music.163.com/api/search/get?s="..name.."&type=1&offset=0&total=true&limit="..sl)
return fw
end
-----
--歌词

--播放音乐
function play(id,name)
gg.toast("正在播放音乐："..name,true)
gg.playMusic("http://music.163.com/song/media/outer/url?id="..id..".mp3")
end
--停止播放
function stop()
gg.toast("正在停止音乐")
for i=1,100 do
gg.playMusic("stop")
gg.playMusic("stop")
gg.playMusic("stop")
end
end
----
function Play(gqlb,idb)
SN = gg.choice(gqlb,nil,ts)
if SN == nil then XGCK =-1 else
sn=gg.choice({"播放"},nil,"歌曲："..gqlb[SN])
if sn == nil then end
if sn == 1 then
play(idb[SN],gqlb[SN])
end
XGCK=-1
end
end
function zjson(jsonr)
local str = jsonr
-- 匹配Json Key的正则表达式
local pattern = "\"[%w]+\":"
string.gsub(str, pattern, function(v)
    if string.find(str, v) then
        str = string.gsub(str, v, string.gsub(v, "\"", ""))
    end
end)
str = string.gsub(str, ":", "=")
str = string.gsub(str, "%[", "{")
str = string.gsub(str, "%]", "}")
local data = "return " .. str
local res = load(data)()
return res
end



function json(con)
res=zjson(con)
zd=res.result.songCount
pd=go3-zd
if pd <= 0 then else go3=zd end
ts="《"..go1.."》找到"..zd.."首歌曲，当前显示"..go3.."首"
gqlb={}
idb={}
for i=1,go3 do
gqlb[i]=res.result.songs[i].name
idb[i]=res.result.songs[i].id
end
--print(idb)
end
function YY998() Obtain=gg.makeRequest("https://api.uomg.com/api/rand.music?sort=热歌榜&format=json").content muchen=Obtain:match('url":"(.-)","picurl') gg.playMusic(muchen) end 



function K()  
 SN = gg.choice({
   "搜索歌曲🔍",
   "️搜索列表🌐️",
   "播放热歌📀",
   "停止播放💿",
   "返回主页️🗿",
},2018,os.date("⏱当前时间%Y年%m月%d日%H时%M分%S秒⏱"))
if SN==1 then s1() end
if SN==2 then Play(gqlb,idb) end
if SN==3 then YY998() end
if SN==4 then stop() end
if SN==5 then Main() end
XGCK=-1
end



function s1()
search = gg.prompt({
"输入要搜索的歌曲\n可加上歌手名字",
"设置显示数量(数字)",
},g.sel,{
"text",
})
if search == nil then Main3() end
gg.saveVariable(search,g.config)
bei()
go1=search[1]
go3=search[2]
jg=start(go1,go3)
if jg.code == 200 then
fh=jg.content
fh=json(fh)
--print(fh)
Play(gqlb,idb)
else
function inspect()
gg.alert("访问网络异常，错误代码：\n\n"..jg.code)
end
if not pcall(inspect) then print("网络异常，请重试") os.exit() end
end
XGCK=-1
end
-----------------------↑音乐播放配置------------------




----------------------------盗源码-----------------
----------------------------------------------------
----------------------------------------------------
----------------------------------------------------
--------------------没🐴---------------------------
----------------------------------------------------
----------------------------------------------------
----------------------------------禁止二改---------
----------------------------------------------------













-----------------------↓End Pid配置------------------
function Exit()
print("欢迎下次使用       官网ficktools.top                 QQ群194119288")
os.exit()
end
cs = "欢迎下次使用"
while true do
  if gg.isVisible(true) then
    XGCK = 1
    gg.setVisible(false)
  end
  gg.clearResults()
  if XGCK == 1 then
    Main()
  end
end