









local json = json


function Address(adds,offset,chang,value,flags,freeze,save,name)local add=gg.getRangesList(adds)[1]["start"]+offset local data={{["address"]=add,["value"]=value,["flags"]=flags,["freeze"]=freeze}}if chang==true then gg.setValues(data)end if freeze or save ==true then gg.addListItems(data)end if name~="false" then gg.toast("ğ¡["..name.."]å·²æ³¨å¥ğ¡")end end

local bx=os.date("%Yå¹´%mæ%dæ¥%Hæ¶%Må%Sç§") print(bx)
bqt={"ğ¬","ğ§¸","ğ","ğ","ğ¡","ğ¶","ğ¥","â¡","âï¸","ğ»","â­","ğº","ğ","ğ§","ğ«","â¡",}
function split(szFullString, szSeparator) local nFindStartIndex = 1 local nSplitIndex = 1 local nSplitArray = {} while true do local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex) if not nFindLastIndex then nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString)) break end nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1) nFindStartIndex = nFindLastIndex + string.len(szSeparator) nSplitIndex = nSplitIndex + 1 end return nSplitArray end function xgxc(szpy, qmxg) for x = 1, #(qmxg) do xgpy = szpy + qmxg[x]["offset"] xglx = qmxg[x]["type"] xgsz = qmxg[x]["value"] xgdj = qmxg[x]["freeze"] if xgdj == nil or xgdj == "" then gg.setValues({[1] = {address = xgpy, flags = xglx, value = xgsz}}) else gg.addListItems({[1] = {address = xgpy, flags = xglx, freeze = xgdj, value = xgsz}}) end xgsl = xgsl + 1 xgjg = true end end function xqmnb(qmnb) gg.clearResults() gg.setRanges(qmnb[1]["memory"]) gg.searchNumber(qmnb[3]["value"], qmnb[3]["type"]) if gg.getResultCount() == 0 then gg.toast(qmnb[2]["name"] .. "å¼å¯å¤±è´¥") else gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) if gg.getResultCount() == 0 then gg.toast(qmnb[2]["name"] .. "å¼å¯å¤±è´¥") else sl = gg.getResults(999999) sz = gg.getResultCount() xgsl = 0 if sz > 999999 then sz = 999999 end for i = 1, sz do pdsz = true for v = 4, #(qmnb) do if pdsz == true then pysz = {} pysz[1] = {} pysz[1].address = sl[i].address + qmnb[v]["offset"] pysz[1].flags = qmnb[v]["type"] szpy = gg.getValues(pysz) pdpd = qmnb[v]["lv"] .. ";" .. szpy[1].value szpd = split(pdpd, ";") tzszpd = szpd[1] pyszpd = szpd[2] if tzszpd == pyszpd then pdjg = true pdsz = true else pdjg = false pdsz = false end end end if pdjg == true then szpy = sl[i].address xgxc(szpy, qmxg) end end if xgjg == true then gg.toast(qmnb[2]["name"] .. "å¼å¯æå,æ¹" .. xgsl .. "æ¡æ°æ®") else gg.toast(qmnb[2]["name"] .. "å¼å¯å¤±è´¥") end end end end
function SearchWrite(tb1, tb2, dataType, Name) local lt1={} local lt2={} local mm1={["ä¸»ç¹å¾ç "] = tb1[1][1],["ç±»å"] = dataType } table.insert(lt1,1,mm1)   for i=2 , #tb1 do     local mm2={["å¯ç¹å¾ç "] = tb1[i][1],["åç§»"] = tb1[i][2]}     table.insert(lt1,i,mm2)   end   for i=1 , #tb2 do     if tb2[i][2]~=nil then       local mm3={["ä¿®æ¹"] = tb2[i][1],["åç§»"] = tb2[i][2]}       table.insert(lt2,i,mm3)      else       local mm3={["ä¿®æ¹"] = false,["åç§»"] = tb2[i][1]}       table.insert(lt2,i,mm3)     end   end   LongTao(lt1, lt2 ) end  function LongTao(Search, Write)   gg.clearResults()   gg.setVisible(false)   lx=Search[1]["ç±»å"]   gg.searchNumber(Search[1]["ä¸»ç¹å¾ç "], lx)   local count = gg.getResultCount()   local result = gg.getResults(count)   gg.clearResults()   local data = {}   if (count > 0) then     gg.toast("å±æç´¢ "..count.." æ¡æ°æ®")     for i, v in ipairs(result) do       v.isUseful = true     end     for k=2, #Search do       local tmp = {}       local num = Search[k]["å¯ç¹å¾ç "]       if Search[k]["ç±»å"]~= nil then            lx =Search[k]["ç±»å"]          else            lx = Search[1]["ç±»å"]         end       for i, v in ipairs(result) do         tmp[#tmp+1] = {}         tmp[#tmp].address = v.address + Search[k]["åç§»"]         tmp[#tmp].flags = lx       end       tmp = gg.getValues(tmp)       for i, v in ipairs(tmp) do         if ( tostring(v.value) ~= tostring(num) ) then           result[i].isUseful = false         end       end     end     for i, v in ipairs(result) do       if (v.isUseful) then         data[#data+1] = v.address       end     end     if (#data > 0) then       local t = {}       for i=1, #data do         for k, w in ipairs(Write) do           if w["ç±»å"] ~= nil then              lx = w["ç±»å"]            else              lx = Search[1]["ç±»å"]           end           t[#t+1] = {}           t[#t].address = data[i] + w["åç§»"]           t[#t].flags = lx           if (w["ä¿®æ¹"]~=nil) and (w["ä¿®æ¹"]~=false) then             t[#t].value = w["ä¿®æ¹"]             gg.setValues(t)             if (w["å»ç»"] == true) then               local item = {}               item[#item+1] = t[#t]               item[#item].freeze = w["å»ç»"]               gg.addListItems(item)             end           end         end       end       gg.loadResults(t)       gg.toast("å±åç§»Î·"..#t.." æ¡æ°æ®ÎÎ")      else       gg.toast("æªå®ä½å°æ°æ®ï¼")       return false     end    else     gg.toast("æªå®ä½å°æ°æ®ï¼")     return false   end end    local app = {} function Assert(data) if data == nil or data == "" or data == "nil" then return false else return true end end function mearrass(memory, array) if Assert(memory) and Assert(array) then return true else return false end end function typetab(array, type) local datatype = {} for i = 1, #array do if Assert(array[i].type) then table.insert(datatype, i, array[i].type) else if Assert(type) then table.insert(datatype, i, type) else return false end end end return true, datatype end function app.memorysearch(memory, array, type) gg.setVisible(false) local isok = mearrass(memory, array) if isok then local isok, datatype = typetab(array, type) if isok then if Assert(array[1].hv) then gg.clearResults() gg.setRanges(memory) gg.searchNumber(array[1].lv .. "~" .. array[1].hv, datatype[1]) else gg.clearResults() gg.setRanges(memory) gg.searchNumber(array[1].lv, datatype[1]) end if gg.getResultCount() == 0 then return false else local tab = {} local data = gg.getResults(gg.getResultCount()) gg.clearResults() for i = 1, #data do data[i].isok = true end for i = 2, #array do local t = {} local offset = array[i].offset for x = 1, #data do t[#t + 1] = {} t[#t].address = data[x].address + offset t[#t].flags = datatype[i] end local t = gg.getValues(t) for z = 1, #t do if Assert(array[i].hv) then if tonumber(t[z].value) < tonumber(array[i].lv) or tonumber(t[z].value) > tonumber(array[i].hv) then  data[z].isok = false end else if tostring(t[z].value) ~= tostring(array[i].lv) then data[z].isok = false end end end end for i = 1, #data do if data[i].isok then tab[#tab + 1] = data[i].address end end if #tab > 0 then return true, tab else return false end end else print("typeåæ°éè¯¯") gg.toast("typeåæ°éè¯¯") os.exit() end else print("memory or arrayåæ°éè¯¯") gg.toast("memory or arrayåæ°éè¯¯") os.exit() end end function app.memoryread(addr, type) local t = {} t[1] = {} t[1].address = addr t[1].flags = type if #t > 0 then return true, gg.getValues(t)[1].value else return false end end function app.memorywrite(addr, type, value, freeze) local t = {} t[1] = {} t[1].address = addr t[1].flags = type t[1].value = value if #t > 0 then if Assert(freeze) then t[1].freeze = freeze return gg.addListItems(t) else return gg.setValues(t) end else return false end end
function setvalue(address,flags,value) PS('ä¿®æ¹å°åæ°å¼(å°å,æ°å¼ç±»å,è¦ä¿®æ¹çå¼)') local tt={} tt[1]={} tt[1].address=address tt[1].flags=flags tt[1].value=value gg.setValues(tt) end
function PS() end function setvalue(address,flags,value) PS('ä¿®æ¹å°åæ°å¼(å°å,æ°å¼ç±»å,è¦ä¿®æ¹çå¼)') local tt={} tt[1]={} tt[1].address=address tt[1].flags=flags tt[1].value=value gg.setValues(tt) end

lde,mnsj={},{Dj="0.01",dv={},lz="/sdcard/.zbb",r={}} lde.gre,lde.sbr,lde.srg,lde.crs=gg.getResults,gg.searchNumber,gg.setRanges,gg.clearResults
function lde.qb()table.remove(bc,#bc)table.remove(bc,#bc)end
function bv(a,b) if not b then b=","end if not tostring(a):find(b)then return{a}end local tab={}local i=0 while true do j=string.find(a,b,i+1) if not j then table.insert(tab,a:sub(i+1,#a)) break end table.insert(tab,a:sub(i+1,j-1)) i=j end return tab end
function so(a,b,c) local csn=gg.getRanges() gg.setVisible(false) lde.srg(a[3]) lde.crs() lde.sbr(a[2],a[4]) local js=gg.getResultCount() local count=lde.gre(js) lde.crs() if #count~=0 then local lode,lope,lobe={},{},{} for p=1,#b do lode[p]={} for i=1,#count do lode[p][i]={} lode[p][i].address=count[i].address+b[p][2] if not b[p][3]then b[p][3]=a[4]end lode[p][i].flags=b[p][3]end lode[p]=gg.getValues(lode[p]) db=bv(b[p][1],"~") if not db[2]then db[2]=db[1]end for i=1,#lode[p] do if tonumber(lode[p][i].value)>=tonumber(db[1]) and tonumber(lode[p][i].value)<=tonumber(db[2]) then lope[#lope+1]={} lope[#lope]=count[i] end end if #lope==0 then lde.srg(csn)if p>11 then p=11 end return "å¼å¯å¤±è´¥" end count=lope lope={}end for i=1,#c do for n=1,#count do lope[#lope+1]={} lope[#lope].address=count[n].address+c[i][2] if not c[i][3]then c[i][3]=a[4]end lope[#lope].flags=c[i][3] if c[i][1] then lope[#lope].value=c[i][1] else lope[#lope].value=gg.getValues(lope)[#lope].value end if c[i][4] then lobe[#lobe+1]={} lobe[#lobe]=lope[#lope] table.remove(lope,#lope) end if c[i][4]==1 then lobe[#lobe].freeze=true elseif c[i][4]==2 then lobe[#lobe].freeze=false end if c[i][5] then lobe[#lobe].name=c[i][5] end end end gg.setValues(lope) gg.addListItems(lobe) lde.srg(csn) return a[1].."å¼å¯æå" else lde.srg(csn) return a[1].."å¼å¯å¤±è´¥!!!" end end
function Address(adds,offset,chang,value,flags,freeze,save,name)local add=gg.getRangesList(adds)[1]["start"]+offset local data={{["address"]=add,["value"]=value,["flags"]=flags,["freeze"]=freeze}}if chang==true then gg.setValues(data)end if freeze or save ==true then gg.addListItems(data)end if name~="false" then gg.toast("ğ¡["..name.."]å·²æ³¨å¥ğ¡")end end

function editData(qmnb,qmxg)gg.setVisible(false)gg.clearResults()qmnbv=qmnb[3]["value"]or qmnb[3][1]qmnbt=qmnb[3]["type"]or qmnb[3][2]qmnbn=qmnb[2]["name"]or qmnb[2][1]gg.setRanges(qmnb[1]["memory"]or qmnb[1][1])gg.searchNumber(qmnbv,qmnbt)gg.refineNumber(qmnbv,qmnbt)sz=gg.getResultCount()if sz==0 then gg.toast(qmnbn.."å¼å¯å¤±è´¥")else sl=gg.getResults(999999)for i=1,sz do pdsz=true for v=4,#qmnb do if pdsz==true then pysz={{}}pysz[1].address=sl[i].address+(qmnb[v]["offset"]or qmnb[v][2])pysz[1].flags=qmnb[v]["type"]or qmnb[v][3]szpy=gg.getValues(pysz)tzszpd=tostring(qmnb[v]["lv"]or qmnb[v][1]):gsub(",","")pyszpd=tostring(szpy[1].value):gsub(",","")if tzszpd==pyszpd then pdjg=true pdsz=true else pdjg=false pdsz=false end end end if pdjg==true then szpy=sl[i].address for x=1,#qmxg do xgsz=qmxg[x]["value"]or qmxg[x][1]xgpy=szpy+(qmxg[x]["offset"]or qmxg[x][2])xglx=qmxg[x]["type"]or qmxg[x][3]xgdj=qmxg[x]["freeze"]or qmxg[x][4]xg={{address=xgpy,flags=xglx,value=xgsz}}if xgdj==true then xg[1].freeze=xgdj gg.addListItems(xg)else gg.setValues(xg)end end xgjg=true end end if xgjg==true then gg.toast(qmnbn.."å¼å¯æå\nèæ¬å¼å¯å±ç¨æ¶:"..os.clock()-time.."ç§")else gg.toast(qmnbn.."å¼å¯å¤±è´¥")end end end
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

recover=gg.getResults(100000)  function AppSearch(SSNR,XGNR,BCNR,notWrite)  gg.clearResults()  gg.setRanges(SSNR["M"])  gg.searchNumber(SSNR[1]["mv"],SSNR[1]["lx"],false,gg.SIGN_EQUAL,(SSNR[1]["addr"] or nil),(SSNR[1]["toAddr"] or nil))  jg=gg.getResults(100000)  local base=(SSNR[1]["offs"] or 0)  local data={}  if #jg==0 then  gg.alert("åè½å:"..(SSNR.name or "æ ").."\n".."ä¿®æ¹å¤±è´¥\n"..(SSNR["error"] or ""))  gg.loadResults(recover)  return nil  end  for i=1,#jg do  jg[i].Useful=true  end  for k=2,#SSNR do  if not SSNR[k] then  break  end  local content={}  local offset=SSNR[k]["offs"]-base  local value=SSNR[k]["sv"]  local type=SSNR[k]["lx"]  local to=(SSNR[k]["to"] or value)  local num={}  if to<value then  to,value=value,to  end    for i=1,#jg do  if jg[i].Useful==true then  table.insert(content,{})  content[#content].address=jg[i].address+offset  content[#content].flags=type  num[#num+1]=i  end  end      if #content==0 then gg.alert("åè½å:"..(SSNR.name or "æ ").."\n".."ä¿®æ¹å¤±è´¥\n"..(SSNR["error"] or "")) gg.loadResults(recover) return nil end  content=gg.getValues(content)      for i,v in pairs(content) do  if tonumber(v.value)<tonumber(value) or tonumber(v.value)>tonumber(to) then  jg[num[i]].Useful=false  end  end    end  for j=1,#jg do  if jg[j].Useful==true then  data[#data+1]=jg[j].address  end  end  if #data==0 then  gg.alert("åè½å:"..(SSNR.name or "æ ").."\n".."ä¿®æ¹å¤±è´¥\n"..(SSNR["error"] or ""))  gg.loadResults(recover)  return nil  end  if notWrite==true then  gg.loadResults(recover)  return data  end  if XGNR then  local write={}  for i=1,#data do  for j=1,#XGNR do  write[#write+1]={}  write[#write].address=data[i]+(XGNR[j][2]-base)  write[#write].flags=XGNR[j][3]  write[#write].value=XGNR[j][1]  write[#write].freeze=XGNR[j][4]  write[#write].name=XGNR[j][5] or nil  if write[#write].freeze==true then  gg.addListItems({[1]=write[#write]})  else  gg.setValues({[1]=write[#write]})  end  if XGNR[j][6]==true then  gg.addListItems({[1]=write[#write]})  end  end  end  end  if BCNR then  local bc={}  for j=1,#data do  for i=1,#BCNR do  bc[#bc+1]={}  bc[#bc].address=data[j]+(BCNR[i][1]-base)  bc[#bc].flags=BCNR[i][2]  bc[#bc].name=BCNR[i][3]  end  end  gg.addListItems(bc)  end  gg.toast("åè½å:"..(SSNR.name or "æ ").."\n".."ä¿®æ¹æå")  gg.loadResults(recover)  end

recover=gg.getResults(100000)
function AppSearch(SSNR,XGNR,BCNR,notWrite)
  gg.clearResults()
  gg.setRanges(SSNR["M"])
  gg.searchNumber(SSNR[1]["mv"],SSNR[1]["lx"],false,gg.SIGN_EQUAL,(SSNR[1]["addr"] or nil),(SSNR[1]["toAddr"] or nil))
  jg=gg.getResults(100000)
  local base=(SSNR[1]["offs"] or 0)
  local data={}
  if #jg==0 then
    gg.toast("åè½å:"..(SSNR.name or "æ ").."\n".."ä¿®æ¹å¤±è´¥\n"..(SSNR["error"] or ""))
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
      
      --â
      for i=1,#jg do
        if jg[i].Useful==true then
          table.insert(content,{})
          content[#content].address=jg[i].address+offset--åç§»é¨å
          content[#content].flags=type
          num[#num+1]=i
        end
      end
      --å­æ¾åç§»åçé¨åâ
      
      --â
      if #content==0 then gg.toast("åè½å:"..(SSNR.name or "æ ").."\n".."ä¿®æ¹å¤±è´¥\n"..(SSNR["error"] or "")) gg.loadResults(recover) return nil end
      content=gg.getValues(content)
      --å­æ¾å®ä¸èµ·gg.getValuesâ
      
      --ä¸èµ·å¤æ­â
      for i,v in pairs(content) do
        if tonumber(v.value)<tonumber(value) or tonumber(v.value)>tonumber(to) then
          jg[num[i]].Useful=false
        end
      end
      --â
      
    end
    
    for j=1,#jg do
      if jg[j].Useful==true then
        data[#data+1]=jg[j].address
      end
    end
     
  if #data==0 then
    gg.toast("åè½å:"..(SSNR.name or "æ ").."\n".."ä¿®æ¹å¤±è´¥\n"..(SSNR["error"] or ""))
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
  gg.toast("åè½å:"..(SSNR.name or "æ ").."\n".."ä¿®æ¹æå")
  gg.loadResults(recover)
end
  
local lhc for i,v in ipairs(gg.getListItems())do if v.value==1701593942 then  tp=1 break end end 
if tp then else so({"è·åè¿·ä½ å·",1701593942,4,4},{{774993416,0xFC}},{{nil,0,4,2}}) end
local tf for i,v in ipairs(gg.getListItems())do if v.value==1701593942 then  mkl=gg.getValues({{address=v.address+0x174,flags=v.flags}}) mnh=mkl[1].value tf=1 break end end if tf then if mnh==0 then Mcn=io.open("/sdcard/IDæä»¶.txt", "rb") if Mcn == nil then a="ææªè·åè¿·ä½ å·" else  a=io.open("/sdcard/IDæä»¶.txt","r"):read("*a")  end else io.open("/sdcard/IDæä»¶.txt","w"):write(mnh):close() a = io.open("/sdcard/IDæä»¶.txt","r"):read("*a")  end else  Mcn=io.open("/sdcard/IDæä»¶.txt", "rb")  if Mcn == nil then a="ææªè·åè¿·ä½ å·" else a=io.open("/sdcard/IDæä»¶.txt","r"):read("*a")end end

gg.toast("è·åè¿·ä½ å·ç¶æï¼"..a.."")



-------------------------é²ç¬¬ä¸æ¹è°ç¨---------------------------
fangyu=[=[
 local info = {}
for i = 1, 10 do
    info[i] = debug.getinfo(i + 1)
end
info = #info
while info ~= 2 or debug.getinfo(0) or not debug.getinfo(1) do
    return 
gg.alert("æ£æµå°æ¨ä½¿ç¨äºç¬¬ä¸æ¹æå¼èæ¬â¼ï¸\nå«æ³ä½¿ç¨æ¦æªå¨â¼ï¸\nå æ­¤è§¦åæ ¸å¿é²å¾¡")
end 
]=]

-----------------Endéç½®--------------
uper ='å¼å§æ³¨å¥'i='æ çº¿ç§æ' 
print(i)print(i)print(i)print(i)
-----------------------------
gg.toast("æ¬¢è¿ä½¿ç¨æ çº¿è¾å© å°æ¬çVIPå®¢æ·,")
-------------------å¼å§é³ä¹éç½®------------
LQ="æ¬¢è¿ä½¿ç¨æ çº¿è¾å©ï¼æ¬è¾å©ç±Hï¼Kï¼Eå·¥ä½å®¤å¼æº."
gg.playMusic("https://fanyi.baidu.com/gettts?lan=zh&text="..LQ.."&spd=5&source=wise")
----------------------------------------------------
function mus() Obtain=gg.makeRequest("https://api.uomg.com/api/rand.music?sort=ç­æ­æ¦&format=json").content muchen=Obtain:match('url":"(.-)","picurl') gg.playMusic(muchen) end 
--------------------------------------------

-------------------------é²éªlua----------------
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
  gg.toast("å¤´åæ¡ä¿®æ¹æå")
  --[[
local t = {"libAppPlayJNI.so:bss", "Cb"}
local tt = {0x5E3A8, 0xC20, 0x3E8}
local ttt = S_Pointer(t, tt, true)
gg.setValues({{address = ttt, flags = 64, value = txk, freeze = true}})
]]

Obtain=gg.makeRequest("https://api.uomg.com/api/rand.music?sort=ç­æ­æ¦&format=json").content muchen=Obtain:match('url":"(.-)","picurl') gg.playMusic(muchen)


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
	 gg.toast("é²éªæå")
	 gg.clearResults()
end
--------------------éæºä¸è¨--------------------
Y=gg.makeRequest("https://v1.hitokoto.cn/").content
Q=string.match(Y,'hitokoto(.+)type')
F=string.gsub(Q,'":"',"")
K=string.gsub(F,'","',"")
--------------------å¨ç½å¯å¨---------------
wljbht = "https://api.iflynote.com/notes/share/note/shareFileDetail?fid=1658915929921553"
  BX = gg.makeRequest(wljbht).content 
    qwtjqdcs = BX:match("pv\":(.-),\"")









------------------å¼å§ä»ç»çé¢--------------
local tc = gg.alert("ğ§æ¬è¾å©ä¸ºBetaç,\néæºä¸è¨:".."ã"..K.."ã",
"æµè¯ç»å½"
,"éåºè¾å©"
,"è¿å¥è¾å©")
if tc == 1 then mus() end
if tc == 2 then os.exit() end
if tc == 3 then mnsjfs() end









------------------ä»¥ä¸æ¯ggä¿®æ¹å¨å½æ°æä»¶ä¸è¦ä¹±æ¹--------------
function HaoGe1(Range,Type,Search,Write) gg.clearResults() gg.setRanges(Range) gg.setVisible(false) gg.searchNumber(Search[1][1],Type) local count=gg.getResultCount() local result=gg.getResults(count) gg.clearResults() local data={} local base=Search[1][2] if(count>0)then for i,v in ipairs(result)do v.isUseful=true end for k=2,#Search do local tmp={} local offset=Search[k][2]-base local num=Search[k][1] for i,v in ipairs(result)do tmp[#tmp+1]={} tmp[#tmp].address=v.address+offset tmp[#tmp].flags=v.flags end tmp=gg.getValues(tmp) for i,v in ipairs(tmp)do if(tostring(v.value)~=tostring(num))then result[i].isUseful=false end end end for i,v in ipairs(result)do if(v.isUseful)then data[#data+1]=v.address end end if(#data>0)then gg.toast("ğæç´¢å°"..#data.."æ°æ®ğ°å¼å§è¿è¡åç§»") local t={} local base=Search[1][2] for i=1,#data do for k,w in ipairs(Write)do offset=w[2]-base t[#t+1]={} t[#t].address=data[i]+offset t[#t].flags=Type t[#t].value=w[1] if(w[3]==true)then local item={} item[#item+1]=t[#t] item[#item].freeze=true gg.addListItems(item) end end end gg.setValues(t) gg.sleep(400) gg.toast("ğ¬"..Name.."æåğ å±ä¿®æ¹"..#t.."æ°æ®") else gg.toast("â"..Name.."å¤±è´¥") return false end else gg.toast("â"..Name.."å¤±è´¥") return false end end
function HaoGe(Search,Get,Type,Range,Name) gg.clearResults() gg.setRanges(Range) gg.setVisible(false) if Search[1][1]~=false then gg.searchAddress(Search[1][1],0xFFFFFFFF,Search[1][4] or Type,gg.SIGN_EQUAL,Search[1][5] or 1,Search[1][6] or -1) end gg.searchNumber(Search[1][2],Search[1][4] or Type,false,gg.SIGN_EQUAL,Search[1][5] or 1,Search[1][6] or -1) local count=gg.getResultCount() local result=gg.getResults(count) gg.clearResults() local data={} local base=Search[1][3] if (count > 0) then for i,v in ipairs(result) do v.isUseful=true end for k=2,#Search do local tmp={} local offset=Search[k][2] - base local num=Search[k][1] for i,v in ipairs(result) do tmp[#tmp+1]={} tmp[#tmp].address=v.address+offset tmp[#tmp].flags=Search[k][3] or Type end tmp=gg.getValues(tmp) for i,v in ipairs(tmp) do if v.flags==16 or v.flags==64 then values=tostring(v.value):sub(1,6) num=tostring(num):sub(1,6) else values=v.value end if tostring(values)~=tostring(num) then result[i].isUseful=false end end end for i,v in ipairs(result) do if (v.isUseful) then data[#data+1]=v.address end end if (#data > 0) then local t,t_={},{} local base=Search[1][3] for i=1,#data do for k,w in ipairs(Get) do offset=w[2] - base if w[1]==false then t_[#t_+1]={} t_[#t_].address=data[i]+offset t_[#t_].flags=Type th_=(th_) and th_+1 or 1 else t[#t+1]={} t[#t].address=data[i]+offset t[#t].flags=w[3] or Type t[#t].value=w[1] tg_=(tg_) and tg_+1 or 1 if (w[4]==true) then local item={} item[#item+1]=t[#t] item[#item].freeze=w[4] gg.addListItems(item) end end end end tg=(tg_) and "ä¿®æ¹"..tg_.."æ°æ®" or "" th=(th_) and "" or "" gg.setValues(t) t_=gg.getValues(t_) gg.loadResults(t_) gg.toast(""..Name..tg) tg_,th_=nil,nil else gg.toast("æç´¢ä¸å°",false) return false end else gg.toast("æç´¢ä¸å°") return false end end
function split(szFullString, szSeparator) local nFindStartIndex = 1 local nSplitIndex = 1 local nSplitArray = {} while true do local nFindLastIndex = string.find (szFullString, szSeparator, nFindStartIndex) if not nFindLastIndex then nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len (szFullString)) break end nSplitArray[nSplitIndex] = string.sub (szFullString, nFindStartIndex, nFindLastIndex - 1) nFindStartIndex = nFindLastIndex + string.len (szSeparator) nSplitIndex = nSplitIndex + 1 end return nSplitArray end function xgxc(szpy, qmxg) for x = 1, #(qmxg) do xgpy = szpy + qmxg[x]["offset"] xglx = qmxg[x]["type"] xgsz = qmxg[x]["value"] xgdj = qmxg[x]["freeze"] if xgdj == nil or xgdj == "" then gg.setValues({[1] = {address = xgpy, flags = xglx, value = xgsz}}) else gg.addListItems({[1] = {address = xgpy, flags = xglx, freeze = xgdj, value = xgsz}}) end xgsl = xgsl + 1 xgjg = true end end function xqmnb(qmnb) gg.clearResults() gg.setRanges(qmnb[1]["memory"]) gg.searchNumber(qmnb[3]["value"], qmnb[3]["type"]) if gg.getResultCount() == 0 then gg.toast(qmnb[2]["name"] .. "å¼å¯å¤±è´¥") else gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) if gg.getResultCount() == 0 then gg.toast(qmnb[2]["name"] .. "å¼å¯å¤±è´¥") else sl = gg.getResults(999999) sz = gg.getResultCount() xgsl = 0 if sz > 999999 then sz = 999999 end for i = 1, sz do pdsz = true for v = 4, #(qmnb) do if pdsz == true then pysz = {} pysz[1] = {} pysz[1].address = sl[i].address + qmnb[v]["offset"] pysz[1].flags = qmnb[v]["type"] szpy = gg.getValues(pysz) pdpd = qmnb[v]["lv"] .. ";" .. szpy[1].value szpd = split(pdpd, ";") tzszpd = szpd[1] pyszpd = szpd[2] if tzszpd == pyszpd then pdjg = true pdsz = true else pdjg = false pdsz = false end end end if pdjg == true then szpy = sl[i].address xgxc(szpy, qmxg) end end if xgjg == true then gg.toast(qmnb[2]["name"] .. "å¼å¯æå,å±ä¿®æ¹" .. xgsl .. "æ¡æ°æ®") else gg.toast(qmnb[2]["name"] .. "å¼å¯å¤±è´¥") end end end end function edit(orig,ret)_om=orig[1].memory or orig[1][1]_ov=orig[3].value or orig[3][1]_on=orig[2].name or orig[2][1]gg.clearResults()gg.setRanges(_om)gg.searchNumber(_ov,orig[3].type or orig[3][2])sz=gg.getResultCount()if sz<1 then gg.toast(_on.."å¼å¯å¤±è´¥")else sl=gg.getResults(720)for i=1,sz do ist=true for v=4,#orig do if ist==true and sl[i].value==_ov then cd={{}}cd[1].address=sl[i].address+(orig[v].offset or orig[v][2])cd[1].flags=orig[v].type or orig[v][3]szpy=gg.getValues(cd)cdlv=orig[v].lv or orig[v][1]cdv=szpy[1].value if cdlv==cdv then pdjg=true ist=true else pdjg=false ist=false end end end if pdjg==true then szpy=sl[i].address for x=1,#(ret)do xgpy=szpy+(ret[x].offset or ret[x][2])xglx=ret[x].type or ret[x][3]xgsz=ret[x].value or ret[x][1]xgdj=ret[x].freeze or ret[x][4]xgsj={{address=xgpy,flags=xglx,value=xgsz}}if xgdj==true then xgsj[1].freeze=xgdj gg.addListItems(xgsj)else gg.setValues(xgsj)end end xgjg=true end end if xgjg==true then gg.toast(_on.."å¼å¯æå")else gg.toast(_on.."å¼å¯å¤±è´¥")end end end function SearchWrite(Search, Write, Type) gg.clearResults() gg.setVisible(false) gg.searchNumber(Search[1][1], Type) local count = gg.getResultCount() local result = gg.getResults(count) gg.clearResults() local data = {} local base = Search[1][2] if (count > 0) then for i, v in ipairs(result) do v.isUseful = true end for k=2, #Search do local tmp = {} local offset = Search[k][2] - base local num = Search[k][1] for i, v in ipairs(result) do tmp[#tmp+1] = {} tmp[#tmp].address = v.address + offset tmp[#tmp].flags = v.flags end tmp = gg.getValues(tmp) for i, v in ipairs(tmp) do if ( tostring(v.value) ~= tostring(num) ) then result[i].isUseful = false end end end for i, v in ipairs(result) do if (v.isUseful) then data[#data+1] = v.address end end if (#data > 0) then gg.toast("æç´¢å°"..#data.."æ¡æ°æ®") local t = {} local base = Search[1][2] for i=1, #data do for k, w in ipairs(Write) do offset = w[2] - base t[#t+1] = {} t[#t].address = data[i] + offset t[#t].flags = Type t[#t].value = w[1] if (w[3] == true) then local item = {} item[#item+1] = t[#t] item[#item].freeze = true gg.addListItems(item) end end end gg.setValues(t) gg.toast("å·²ä¿®æ¹"..#t.."æ¡æ°æ®") gg.addListItems(t) else gg.toast("Not Found", false) return false end else gg.toast("Not Found") return false end end function split(szFullString, szSeparator) local nFindStartIndex = 1 local nSplitIndex = 1 local nSplitArray = {} while true do local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex) if not nFindLastIndex then nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString)) break end nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1) nFindStartIndex = nFindLastIndex + string.len(szSeparator) nSplitIndex = nSplitIndex + 1 end return nSplitArray end function xgxc(szpy, qmxg) for x = 1, #(qmxg) do xgpy = szpy + qmxg[x]["offset"] xglx = qmxg[x]["type"] xgsz = qmxg[x]["value"] xgdj = qmxg[x]["freeze"] if xgdj == nil or xgdj == "" then gg.setValues({[1] = {address = xgpy, flags = xglx, value = xgsz}}) else gg.addListItems({[1] = {address = xgpy, flags = xglx, freeze = xgdj, value = xgsz}}) end xgsl = xgsl + 1 xgjg = true end end function xqmnb(qmnb) gg.clearResults() gg.setRanges(qmnb[1]["memory"]) gg.searchNumber(qmnb[3]["value"], qmnb[3]["type"]) if gg.getResultCount() == 0 then gg.toast(qmnb[2]["name"] .. "å¼å¯å¤±è´¥") else gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) if gg.getResultCount() == 0 then gg.toast(qmnb[2]["name"] .. "å¼å¯å¤±è´¥") else sl = gg.getResults(999999) sz = gg.getResultCount() xgsl = 0 if sz > 999999 then sz = 999999 end for i = 1, sz do pdsz = true for v = 4, #(qmnb) do if pdsz == true then pysz = {} pysz[1] = {} pysz[1].address = sl[i].address + qmnb[v]["offset"] pysz[1].flags = qmnb[v]["type"] szpy = gg.getValues(pysz) pdpd = qmnb[v]["lv"] .. ";" .. szpy[1].value szpd = split(pdpd, ";") tzszpd = szpd[1] pyszpd = szpd[2] if tzszpd == pyszpd then pdjg = true pdsz = true else pdjg = false pdsz = false end end end if pdjg == true then szpy = sl[i].address xgxc(szpy, qmxg) end end if xgjg == true then gg.toast(qmnb[2]["name"] .. "å¼å¯æå,å±ä¿®æ¹" .. xgsl .. "æ¡æ°æ®") else gg.toast(qmnb[2]["name"] .. "å¼å¯å¤±è´¥") end end end end function jiuyan(qmnb,qmxg)gg.setVisible(false)gg.clearResults()qmnbv=qmnb[3]["value"]or qmnb[3][1]qmnbt=qmnb[3]["type"]or qmnb[3][2]qmnbn=qmnb[2]["name"]or qmnb[2][1]gg.setRanges(qmnb[1]["memory"]or qmnb[1][1])gg.searchNumber(qmnbv,qmnbt)gg.refineNumber(qmnbv,qmnbt)sz=gg.getResultCount()if sz==0 then gg.toast(qmnbn.."å¼å¯å¤±è´¥")else sl=gg.getResults(999999)for i=1,sz do pdsz=true for v=4,#qmnb do if pdsz==true then pysz={{}}pysz[1].address=sl[i].address+(qmnb[v]["offset"]or qmnb[v][2])pysz[1].flags=qmnb[v]["type"]or qmnb[v][3]szpy=gg.getValues(pysz)tzszpd=tostring(qmnb[v]["lv"]or qmnb[v][1]):gsub(",","")pyszpd=tostring(szpy[1].value):gsub(",","")if tzszpd==pyszpd then pdjg=true pdsz=true else pdjg=false pdsz=false end end end if pdjg==true then szpy=sl[i].address for x=1,#qmxg do xgsz=qmxg[x]["value"]or qmxg[x][1]xgpy=szpy+(qmxg[x]["offset"]or qmxg[x][2])xglx=qmxg[x]["type"]or qmxg[x][3]xgdj=qmxg[x]["freeze"]or qmxg[x][4]xg={{address=xgpy,flags=xglx,value=xgsz}}if xgdj==true then xg[1].freeze=xgdj gg.addListItems(xg)else gg.setValues(xg)end end xgjg=true end end if xgjg==true then gg.toast(qmnbn.."ä¿®æ¹ä¸­,å±ä¿®æ¹1æ¡æ°æ®")else gg.toast(qmnbn.."å¼å¯å¤±è´¥")end end end ms={} function setvalue(add,value,falgs,dj) local WY={} WY[1]={} WY[1].address=add WY[1].value=value WY[1].flags=falgs if dj==true then WY[1].freeze=true gg.addListItems(WY) else gg.setValues(WY) end end function ms.ss(num,ty,nc,mb,qs,zd) gg.clearResults() gg.setRanges(nc) gg.searchNumber(num,ty,false,gg.SIGN_EQUAL,qs or 1,zd or -1) if mb~=nil and mb~=false and mb then gg.refineAddress(mb) end Result=gg.getResults(gg.getResultCount()) end function ms.py(num,py,ty) if(Result and #Result~=0)then t={} for i,v in ipairs(Result) do t[i]={} t[i].address=v.address+py t[i].flags=ty end t=gg.getValues(t) for i,v in ipairs(t) do if v.value~=num then Result[i]=nil end end local MS={} for i,v in pairs(Result) do MS[#MS+1]=v end Result=MS end end function ms.bc() data={} if Result==nil or #Result==0 then gg.toast("å¼å¯å¤±è´¥") else for i,v in pairs(Result) do data[#data+1]=v.address end gg.toast("å±æç´¢äº"..(#data).."æ¡æ°æ®") gg.loadResults(Result) end Result=nil end function ms.edit(nn,off,ty,dj) if(Result)then ms.bc() end if #data>0 then for i,v in ipairs(data) do setvalue(v+off,nn,ty,dj or false) end end end
function maoge(Search,Get,Type,Range,Name) gg.clearResults() gg.setRanges(Range) gg.setVisible(false) if Search[1][1]~=false then gg.searchAddress(Search[1][1],0xFFFFFFFF,Search[1][4] or Type,gg.SIGN_EQUAL,Search[1][5] or 1,Search[1][6] or -1) end gg.searchNumber(Search[1][2],Search[1][4] or Type,false,gg.SIGN_EQUAL,Search[1][5] or 1,Search[1][6] or -1) local count=gg.getResultCount() local result=gg.getResults(count) gg.clearResults() local data={} local base=Search[1][3] if (count > 0) then for i,v in ipairs(result) do v.isUseful=true end for k=2,#Search do local tmp={} local offset=Search[k][2] - base local num=Search[k][1] for i,v in ipairs(result) do tmp[#tmp+1]={} tmp[#tmp].address=v.address+offset tmp[#tmp].flags=Search[k][3] or Type end tmp=gg.getValues(tmp) for i,v in ipairs(tmp) do if v.flags==16 or v.flags==64 then values=tostring(v.value):sub(1,6) num=tostring(num):sub(1,6) else values=v.value end if tostring(values)~=tostring(num) then result[i].isUseful=false end end end for i,v in ipairs(result) do if (v.isUseful) then data[#data+1]=v.address end end if (#data > 0) then local t,t_={},{} local base=Search[1][3] for i=1,#data do for k,w in ipairs(Get) do offset=w[2] - base if w[1]==false then t_[#t_+1]={} t_[#t_].address=data[i]+offset t_[#t_].flags=Type th_=(th_) and th_+1 or 1 else t[#t+1]={} t[#t].address=data[i]+offset t[#t].flags=w[3] or Type t[#t].value=w[1] tg_=(tg_) and tg_+1 or 1 if (w[4]==true) then local item={} item[#item+1]=t[#t] item[#item].freeze=w[4] gg.addListItems(item) end end end end tg=(tg_) and "  "..tg_.."  " or "" th=(th_) and "" or "" gg.setValues(t) t_=gg.getValues(t_) gg.loadResults(t_) gg.toast("\n"..Name..tg) tg_,th_=nil,nil else gg.toast(" å¼å¯å¤±è´¥ ",false) return false end else gg.toast(" å¼å¯å¤±è´¥") return false end end
function setvalue(address,flags,value) local tt={} tt[1]={} tt[1].address=address tt[1].flags=flags tt[1].value=value gg.setValues(tt) end
function PS() end function setvalue(address,flags,value) PS('ä¿®æ¹å°åæ°å¼(å°å,æ°å¼ç±»å,è¦ä¿®æ¹çå¼)') local tt={} tt[1]={} tt[1].address=address tt[1].flags=flags tt[1].value=value gg.setValues(tt) end
function HaoGe(Search,Get,Type,Range,Name) gg.clearResults() gg.setRanges(Range) gg.setVisible(false) if Search[1][1]~=false then gg.searchAddress(Search[1][1],0xFFFFFFFF,Search[1][4] or Type,gg.SIGN_EQUAL,Search[1][5] or 1,Search[1][6] or -1) end gg.searchNumber(Search[1][2],Search[1][4] or Type,false,gg.SIGN_EQUAL,Search[1][5] or 1,Search[1][6] or -1) local count=gg.getResultCount() local result=gg.getResults(count) gg.clearResults() local data={} local base=Search[1][3] if (count > 0) then for i,v in ipairs(result) do v.isUseful=true end for k=2,#Search do local tmp={} local offset=Search[k][2] - base local num=Search[k][1] for i,v in ipairs(result) do tmp[#tmp+1]={} tmp[#tmp].address=v.address+offset tmp[#tmp].flags=Search[k][3] or Type end tmp=gg.getValues(tmp) for i,v in ipairs(tmp) do if v.flags==16 or v.flags==64 then values=tostring(v.value):sub(1,6) num=tostring(num):sub(1,6) else values=v.value end if tostring(values)~=tostring(num) then result[i].isUseful=false end end end for i,v in ipairs(result) do if (v.isUseful) then data[#data+1]=v.address end end if (#data > 0) then local t,t_={},{} local base=Search[1][3] for i=1,#data do for k,w in ipairs(Get) do offset=w[2] - base if w[1]==false then t_[#t_+1]={} t_[#t_].address=data[i]+offset t_[#t_].flags=Type th_=(th_) and th_+1 or 1 else t[#t+1]={} t[#t].address=data[i]+offset t[#t].flags=w[3] or Type t[#t].value=w[1] tg_=(tg_) and tg_+1 or 1 if (w[4]==true) then local item={} item[#item+1]=t[#t] item[#item].freeze=w[4] gg.addListItems(item) end end end end tg=(tg_) and "\nğ¥ä¿®æ¹"..tg_.."æ°æ®" or "" th=(th_) and "" or "" gg.setValues(t) t_=gg.getValues(t_) gg.loadResults(t_) gg.toast("\n"..Name..tg) tg_,th_=nil,nil else gg.toast("âæç´¢ä¸å°â",false) return false end else gg.toast("âæç´¢ä¸å°â") return false end end--[[éç½®3]]function PS() end function setvalue(address,flags,value) PS('ä¿®æ¹å°åæ°å¼(å°å,æ°å¼ç±»å,è¦ä¿®æ¹çå¼)') local tt={} tt[1]={} tt[1].address=address tt[1].flags=flags tt[1].value=value gg.setValues(tt) end local time=os.clock() local PACKAGE=(gg.getTargetInfo(gg.getTargetPackage()).packageName); local PID=gg.getTargetInfo().activities[1].label if PACKAGE == "com.tencent.iglitece" then so=gg.getRangesList('libUE4.so')[1].start else  end--[[éç½®4]]QCFZLB = gg.searchNumber QCFZNB = gg.editAll QCFZNP = gg.clearResults TYJQ = "2.0;2,048.0;300.0;0.05000000075"TYJS = "0;7.0064923e-45;1;100;1;2,500,000,000.0;0.10000000149;88"XGJQ = "80"XGJS = "2"QCFZNP()--[[éç½®5]]local app = {} function Assert(data) if data == nil or data == "" or data == "nil" then return false else return true end end function mearrass(memory, array) if Assert(memory) and Assert(array) then return true else return false end end function typetab(array, type) local datatype = {} for i = 1, #array do if Assert(array[i].type) then table.insert(datatype, i, array[i].type) else if Assert(type) then table.insert(datatype, i, type) else return false end end end return true, datatype end function app.memorysearch(memory, array, type) gg.setVisible(false) local rx = mearrass(memory, array) if rx then local rx, datatype = typetab(array, type) if rx then if Assert(array[1].hv) then gg.clearResults() gg.setRanges(memory) gg.searchNumber(array[1].lv .. "~" .. array[1].hv, datatype[1]) else gg.clearResults() gg.setRanges(memory) gg.searchNumber(array[1].lv, datatype[1]) end if gg.getResultCount() == 0 then return false else local tab = {} local data = gg.getResults(gg.getResultCount()) gg.clearResults() for i = 1, #data do data[i].rx = true end for i = 2, #array do local t = {} local offset = array[i].offset for x = 1, #data do t[#t + 1] = {} t[#t].address = data[x].address + offset t[#t].flags = datatype[i] end local t = gg.getValues(t) for z = 1, #t do if Assert(array[i].hv) then if tonumber(t[z].value) < tonumber(array[i].lv) or tonumber(t[z].value) > tonumber(array[i].hv) then data[z].rx = false end else if tostring(t[z].value) ~= tostring(array[i].lv) then data[z].rx = false end end end end for i = 1, #data do if data[i].rx then tab[#tab + 1] = data[i].address end end if #tab > 0 then return true, tab else return false end end else print("typeåæ°éè¯¯") gg.toast("typeåæ°éè¯¯") os.exit() end else print("memory or arrayåæ°éè¯¯") gg.toast("memory or arrayåæ°éè¯¯") os.exit() end end function app.memoryread(addr, type) local t = {} t[1] = {} t[1].address = addr t[1].flags = type if #t > 0 then return true, gg.getValues(t)[1].value else return false end end function app.memorywrite(addr, type, value, freeze) local t = {} t[1] = {} t[1].address = addr t[1].flags = type t[1].value = value if #t > 0 then if Assert(freeze) then t[1].freeze = freeze gg.setValues(t) return gg.addListItems(t) else return gg.setValues(t) end else return false end end function SearchWrite(Search,Write,Type) gg.clearResults() gg.setVisible(false) gg.searchNumber(Search[1][1],Type) local count=gg.getResultCount() local result=gg.getResults(count) gg.clearResults() local data={} local base=Search[1][2] if(count>0)then for i,v in ipairs(result)do v.isUseful=true end for k=2,#Search do local tmp={} local offset=Search[k][2]-base local num=Search[k][1] for i,v in ipairs(result)do tmp[#tmp+1]={} tmp[#tmp].address=v.address+offset tmp[#tmp].flags=v.flags end tmp=gg.getValues(tmp) for i,v in ipairs(tmp)do if(tostring(v.value)~=tostring(num))then result[i].isUseful=false end end end for i,v in ipairs(result)do if(v.isUseful)then data[#data+1]=v.address end end if(#data>0)then gg.toast(Name.."å±æç´¢å°"..#data.."ä¸ªæ°æ®") local t={} local base=Search[1][2] for i=1,#data do for k,w in ipairs(Write)do offset=w[2]-base t[#t+1]={} t[#t].address=data[i]+offset t[#t].flags=Type t[#t].value=w[1] if(w[3]==true)then local item={} item[#item+1]=t[#t] item[#item].freeze=true gg.addListItems(item) end end end gg.setValues(t) gg.sleep(500) gg.toast(Name.."å¼å¯æå,å±ä¿®æ¹"..#t.."æ¡æ°æ®") else gg.toast(Name.."å¯ç¹å¾ç éè¯¯orè¸ä¸\næèæ¯å·²ç»å¼å¯è¿äº") return false end else gg.toast(Name.."ä¸»ç¹å¾ç éè¯¯orè¸ä¸\næèæ¯å·²ç»å¼å¯è¿äº") return false end end function SearchWrite(Search, Write, Type) gg.clearResults() gg.setVisible(false) gg.searchNumber(Search[1][1], Type) local count = gg.getResultCount() local result = gg.getResults(count) gg.clearResults() local data = {} local base = Search[1][2] if (count > 0) then for i, v in ipairs(result) do v.isUseful = true end for k=2, #Search do local tmp = {} local offset = Search[k][2] - base local num = Search[k][1] for i, v in ipairs(result) do tmp[#tmp+1] = {} tmp[#tmp].address = v.address + offset tmp[#tmp].flags = v.flags end tmp = gg.getValues(tmp) for i, v in ipairs(tmp) do if ( tostring(v.value) ~= tostring(num) ) then result[i].isUseful = false end end end for i, v in ipairs(result) do if (v.isUseful) then data[#data+1] = v.address end end if (#data > 0) then gg.toast("æç´¢Î·"..#data.."æ¡ä»£ç ") local t = {} local base = Search[1][2] for i=1, #data do for k, w in ipairs(Write) do offset = w[2] - base t[#t+1] = {} t[#t].address = data[i] + offset t[#t].flags = Type t[#t].value = w[1] if (w[3] == true) then local item = {} item[#item+1] = t[#t] item[#item].freeze = true gg.addListItems(item) end end end gg.setValues(t) else gg.toast("Not Found", false) return false end else gg.toast("Not Found") return false end end function split(szFullString, szSeparator) local nFindStartIndex = 1 local nSplitIndex = 1 local nSplitArray = {} while true do local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex) if not nFindLastIndex then nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString)) break end nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1) nFindStartIndex = nFindLastIndex + string.len(szSeparator) nSplitIndex = nSplitIndex + 1 end return nSplitArray end function xgxc(szpy, qmxg) for x = 1, #(qmxg) do xgpy = szpy + qmxg[x]["offset"] xglx = qmxg[x]["type"] xgsz = qmxg[x]["value"] gg.setValues({[1] = {address = xgpy, flags = xglx, value = xgsz}}) xgsl = xgsl + 1 end end function xqmnb(qmnb) gg.clearResults() gg.setRanges(qmnb[1]["memory"]) gg.searchNumber(qmnb[3]["value"], qmnb[3]["type"]) if gg.getResultCount() == 0 then gg.toast(qmnb[2]["name"] .. "å¼å¯å¤±è´¥") else gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) if gg.getResultCount() == 0 then gg.toast(qmnb[2]["name"] .. "å¼å¯å¤±è´¥") else sl = gg.getResults(999999) sz = gg.getResultCount() xgsl = 0 if sz > 999999 then sz = 999999 end for i = 1, sz do pdsz = true for v = 4, #(qmnb) do if pdsz == true then pysz = {} pysz[1] = {} pysz[1].address = sl[i].address + qmnb[v]["offset"] pysz[1].flags = qmnb[v]["type"] szpy = gg.getValues(pysz) pdpd = qmnb[v]["lv"] .. ";" .. szpy[1].value szpd = split(pdpd, ";") tzszpd = szpd[1] pyszpd = szpd[2] if tzszpd == pyszpd then pdjg = true pdsz = true else pdjg = false pdsz = false end end end if pdjg == true then szpy = sl[i].address xgxc(szpy, qmxg) xgjg = true end end if xgjg == true then gg.toast(qmnb[2]["name"] .. "å¼å¯æå,å±ä¿®æ¹" .. xgsl .. "æ¡æ°æ®") else gg.toast(qmnb[2]["name"] .. "å¼å¯å¤±è´¥") end end end end function encodes(code) return (code:gsub("..", function(h) return string.char((tonumber(h, 16) + 256 - 13 + 255999744) % 256) end )) end do do for _FORV_3_ = 1, 2000 do load("local results = gg.getFile(5000)")() end end end gg.setRanges(16420) local results = gg.getFile() local results = gg.getResults(5000) gg.setValues(results) local results = gg.getFile() function SearchWrite(Search,Write,Type) gg.clearResults() gg.setVisible(false) gg.searchNumber(Search[1][1],Type) local count=gg.getResultCount() local result=gg.getResults(count) gg.clearResults() local data={} local base=Search[1][2] if(count>0)then for i,v in ipairs(result)do v.isUseful=true end for k=2,#Search do local tmp={} local offset=Search[k][2]-base local num=Search[k][1] for i,v in ipairs(result)do tmp[#tmp+1]={} tmp[#tmp].address=v.address+offset tmp[#tmp].flags=v.flags end tmp=gg.getValues(tmp) for i,v in ipairs(tmp)do if(tostring(v.value)~=tostring(num))then result[i].isUseful=false end end end for i,v in ipairs(result)do if(v.isUseful)then data[#data+1]=v.address end end if(#data>0)then local t={} local base=Search[1][2] for i=1,#data do for k,w in ipairs(Write)do offset=w[2]-base t[#t+1]={} t[#t].address=data[i]+offset t[#t].flags=Type t[#t].value=w[1] if(w[3]==true)then local item={} item[#item+1]=t[#t] item[#item].freeze=true gg.addListItems(item) end end end gg.setValues(t) gg.sleep(500) else return false end else return false end end function Fxs(Search, Write,Neicun,Mingcg,Shuzhiliang) gg.clearResults() gg.setRanges(Neicun) gg.setVisible(false) gg.searchNumber(Search[1][1], Search[1][3]) local count = gg.getResultCount() local result = gg.getResults(count) gg.clearResults() local data = {} local base = Search[1][2] if (count > 0) then for i, v in ipairs(result) do v.isUseful = true end for k=2, #Search do local tmp = {} local offset = Search[k][2] - base local num = Search[k][1] for i, v in ipairs(result) do tmp[#tmp+1] = {} tmp[#tmp].address = v.address + offset tmp[#tmp].flags = Search[k][3] end tmp = gg.getValues(tmp) for i, v in ipairs(tmp) do if ( tostring(v.value) ~= tostring(num) ) then result[i].isUseful = false end end end for i, v in ipairs(result) do if (v.isUseful) then data[#data+1] = v.address end end if (#data > 0) then gg.toast(Mingcg.."å¼å¯æå"..#data.."") local t = {} local base = Search[1][2] if Shuzhiliang == "" and Shuzhiliang > 0 and Shuzhiliang < #data then Shuzhiliang=Shuzhiliang else Shuzhiliang=#data end for i=1, Shuzhiliang do for k, w in ipairs(Write) do offset = w[2] - base t[#t+1] = {} t[#t].address = data[i] + offset t[#t].flags = w[3] t[#t].value = w[1] if (w[4] == true) then local item = {} item[#item+1] = t[#t] item[#item].freeze = true gg.addListItems(item) end end end gg.setValues(t) gg.toast(Mingcg.."å¼å¯æå"..#t.."") gg.addListItems(t) else gg.toast(Mingcg.."å¼å¯å¤±è´¥", false) return false end else gg.toast("å¼å¯å¤±è´¥") return false end end function PS() end function setvalue(address,flags,value) PS('ä¿®æ¹å°åæ°å¼(å°å,æ°å¼ç±»å,è¦ä¿®æ¹çå¼)') local tt={} tt[1]={} tt[1].address=address tt[1].flags=flags tt[1].value=value gg.setValues(tt) end function configure(xgsz,sssz,gssz,xl) gg.clearResults() gg.setRanges(nc) flags=xl gg.searchNumber(sssz,xl, false, 56870912, 0, -1) ssjgsl=gg.getResultCount() if ssjgsl>0 then gg.toast("å±å°"..ssjgsl.."æ¡æ°å¼") gg.searchNumber(gssz,xl, false, 56870912, 0, -1) ssjgs=gg.getResultCount() if ssjgs>0 then else gg.toast("å¼å¯å¤±è´¥ åå :æ¹åç»ææ æ°å¼") end gg.getResults(ssjgs) gg.editAll(xgsz, xl) gg.toast("å¼å¯æå å·²ä¿®æ¹"..ssjgs.."æ¡æ°å¼") else gg.toast("å¼å¯å¤±è´¥ åå :ç»ææ æ°å¼") end end function js(address,flags,value) local jz={} jz[1]={} jz[1].address=address jz[1].flags=flags jz[1].value=value gg.setValues(jz) end function jz(sxg,zs,zsnb) flags=zs value=zsnb so=gg.getRangesList(''..name..'')[1].start js(so+sxg,zs,zsnb) end local ZS_1 = gg.alert local ZS_2 = gg.toast local ZS_3 = gg.searchNumber local ZS_4 = gg.editAll local ZS_5 = gg.setRanges local ZS_6 = gg.getResults local ZS_7 = gg.clearResults local ZS_8 = gg.searchAddress local ZS_9 = gg.getResultCount local ZS_10 = gg.REGION_BAD local ZS_11 = gg.REGION_ANONYMOUS local ZS_12 = gg.REGION_AZSMEM local ZS_13 = gg.REGION_C_ALLOC local ZS_14 = gg.REGION_C_BSS local ZS_15 = gg.REGION_C_code local ZS_16 = gg.REGION_C_HEAP local ZS_17 = gg.REGION_CODE_APP local ZS_18 = gg.REGION_CODE_SYS local ZS_19 = gg.REGION_JAVA local ZS_20 = gg.REGION_JAVA_HEAP local ZS_21 = gg.REGION_OTHER local ZS_22 = gg.REGION_PPSSPP local ZS_23 = gg.REGION_STACK local ZS_24 = gg.TYPE_FLOAT local ZS_25 = gg.SIGN_EQUAL local ZS_26 = gg.TYPE_DWORD local ZS_27 = gg.TYPE_BYTE local ZS_28 = gg.TYPE_WORD local ZS_29 = gg.REGION_VIDEO local ZS_30 = gg.multiChoice local ZS_31 = print function baseAdd(t) local py = gg.getRangesList(t["æè¾°"])[1].start + t["æè¾°"] gg.setValues({ { address = py, flags = t["æè¾°"], value = t["æè¾°"] }})end PT = (os.date("%Yå¹´%mæ%dæ¥%Hæ¶%Må%Sç§"))  --[[èµå¼]]soplan=gg --[[éç½®6]]function HaoGe(Nc,Type,Search,Write) gg.clearResults() gg.setRanges(Nc) gg.setVisible(false) gg.searchNumber(Search[1][1],Type) local count=gg.getResultCount() local result=gg.getResults(count) gg.clearResults() local data={} local base=Search[1][2] if(count>0)then for i,v in ipairs(result)do v.isUseful=true end for k=2,#Search do local tmp={} local offset=Search[k][2]-base local num=Search[k][1] for i,v in ipairs(result)do tmp[#tmp+1]={} tmp[#tmp].address=v.address+offset tmp[#tmp].flags=v.flags end tmp=gg.getValues(tmp) for i,v in ipairs(tmp)do if(tostring(v.value)~=tostring(num))then result[i].isUseful=false end end end for i,v in ipairs(result)do if(v.isUseful)then data[#data+1]=v.address end end if(#data>0)then gg.toast("\nğæç´¢å°"..#data.."æ°æ®\nğå¼å§è¿è¡åç§»") local t={} local base=Search[1][2] for i=1,#data do for k,w in ipairs(Write)do offset=w[2]-base t[#t+1]={} t[#t].address=data[i]+offset t[#t].flags=Type t[#t].value=w[1] if(w[3]==true)then local item={} item[#item+1]=t[#t] item[#item].freeze=true gg.addListItems(item) end end end gg.setValues(t) gg.sleep(400) gg.toast("\nğ¬"..Name.."æå\nğ å±ä¿®æ¹"..#t.."æ°æ®") else gg.toast("\nâ"..Name.."å¤±è´¥") return false end else gg.toast("\nâ"..Name.."å¤±è´¥") return false end end--[[éç½®7]]function STARS(UU,Type,Search,Write) gg.clearResults() gg.setRanges(UU) gg.setVisible(false) gg.searchNumber(Search[1][1],Type) local count=gg.getResultCount() local result=gg.getResults(count) gg.clearResults() local data={} local base=Search[1][2] if(count>0)then for i,v in ipairs(result)do v.isUseful=true end for k=2,#Search do local tmp={} local offset=Search[k][2]-base local num=Search[k][1] for i,v in ipairs(result)do tmp[#tmp+1]={} tmp[#tmp].address=v.address+offset tmp[#tmp].flags=v.flags end tmp=gg.getValues(tmp) for i,v in ipairs(tmp)do if(tostring(v.value)~=tostring(num))then result[i].isUseful=false end end end for i,v in ipairs(result)do if(v.isUseful)then data[#data+1]=v.address end end if(#data>0)then gg.toast("\nğæç´¢å°"..#data.."æ°æ®\nğå¼å§è¿è¡åç§»") local t={} local base=Search[1][2] for i=1,#data do for k,w in ipairs(Write)do offset=w[2]-base t[#t+1]={} t[#t].address=data[i]+offset t[#t].flags=Type t[#t].value=w[1] if(w[3]==true)then local item={} item[#item+1]=t[#t] item[#item].freeze=true gg.addListItems(item) end end end gg.setValues(t) gg.sleep(400) gg.toast("\n"..Name.."æå\nâ¯å±ä¿®æ¹"..#t.."æ°æ®ï¸") else gg.toast("\nâ"..Name.."å¼å¯å¤±è´¥â") return false end else gg.toast("\nâ"..Name.."å¤±è´¥") return false end end--[[éç½®8]]local time=os.clock()--[[éç½®9]]function SearchWrite(Search, Write, Type) gg.clearResults() gg.setVisible(false) gg.searchNumber(Search[1][1], Type) local count = gg.getResultCount() local result = gg.getResults(count) gg.clearResults() local data = {} local base = Search[1][2] if (count > 0) then for i, v in ipairs(result) do v.isUseful = true end for k=2, #Search do local tmp = {} local offset = Search[k][2] - base local num = Search[k][1] for i, v in ipairs(result) do tmp[#tmp+1] = {} tmp[#tmp].address = v.address + offset tmp[#tmp].flags = v.flags end tmp = gg.getValues(tmp) for i, v in ipairs(tmp) do if ( tostring(v.value) ~= tostring(num) ) then result[i].isUseful = false end end end for i, v in ipairs(result) do if (v.isUseful) then data[#data+1] = v.address end end if (#data > 0) then gg.toast("ğ¹:ä¿®æ¹"..#data.."æ¡æ°æ®.å¼å¯æå") local t = {} local base = Search[1][2] for i=1, #data do for k, w in ipairs(Write) do offset = w[2] - base t[#t+1] = {} t[#t].address = data[i] + offset t[#t].flags = Type t[#t].value = w[1] if (w[3] == true) then local item = {} item[#item+1] = t[#t] item[#item].freeze = true gg.addListItems(item) end end end gg.setValues(t) else gg.toast("ğ¹:æç´¢0æ¡æ°æ®.ä¿®æ¹å¤±è´¥", false) return false end else gg.toast("â ï¸:æç´¢0æ¡æ°æ®.ä¿®æ¹å¤±è´¥") return false end end--[[éç½®10]]local app = {} function Assert(data) if data == nil or data == "" or data == "nil" then return false else return true end end function mearrass(memory, array) if Assert(memory) and Assert(array) then return true else return false end end function typetab(array, type) local datatype = {} for i = 1, #array do if Assert(array[i].type) then table.insert(datatype, i, array[i].type) else if Assert(type) then table.insert(datatype, i, type) else return false end end end return true, datatype end function app.memorysearch(memory, array, type) soplan.setVisible(false) local rx = mearrass(memory, array) if rx then local rx, datatype = typetab(array, type) if rx then if Assert(array[1].hv) then soplan.clearResults() soplan.setRanges(memory) soplan.searchNumber(array[1].lv .. "~" .. array[1].hv, datatype[1]) else soplan.clearResults() soplan.setRanges(memory) soplan.searchNumber(array[1].lv, datatype[1]) end if soplan.getResultCount() == 0 then return false else local tab = {} local data = soplan.getResults(soplan.getResultCount()) soplan.clearResults() for i = 1, #data do data[i].rx = true end for i = 2, #array do local t = {} local offset = array[i].offset for x = 1, #data do t[#t + 1] = {} t[#t].address = data[x].address + offset t[#t].flags = datatype[i] end local t = soplan.getValues(t) for z = 1, #t do if Assert(array[i].hv) then if tonumber(t[z].value) < tonumber(array[i].lv) or tonumber(t[z].value) > tonumber(array[i].hv) then data[z].rx = false end else if tostring(t[z].value) ~= tostring(array[i].lv) then data[z].rx = false end end end end for i = 1, #data do if data[i].rx then tab[#tab + 1] = data[i].address end end if #tab > 0 then return true, tab else return false end end else print("typeåæ°éè¯¯") soplan.toast("typeåæ°éè¯¯") os.exit() end else print("memory or arrayåæ°éè¯¯") soplan.toast("memory or arrayåæ°éè¯¯") os.exit() end end function app.memoryread(addr, type) local t = {} t[1] = {} t[1].address = addr t[1].flags = type if #t > 0 then return true, soplan.getValues(t)[1].value else return false end end function app.memorywrite(addr, type, value, freeze) local t = {} t[1] = {} t[1].address = addr t[1].flags = type t[1].value = value if #t > 0 then if Assert(freeze) then t[1].freeze = freeze soplan.setValues(t) return soplan.addListItems(t) else return soplan.setValues(t) end else return false end end function SearchWrite(Search,Write,Type) soplan.clearResults() soplan.setVisible(false) soplan.searchNumber(Search[1][1],Type) local count=soplan.getResultCount() local result=soplan.getResults(count) soplan.clearResults() local data={} local base=Search[1][2] if(count>0)then for i,v in ipairs(result)do v.isUseful=true end for k=2,#Search do local tmp={} local offset=Search[k][2]-base local num=Search[k][1] for i,v in ipairs(result)do tmp[#tmp+1]={} tmp[#tmp].address=v.address+offset tmp[#tmp].flags=v.flags end tmp=soplan.getValues(tmp) for i,v in ipairs(tmp)do if(tostring(v.value)~=tostring(num))then result[i].isUseful=false end end end for i,v in ipairs(result)do if(v.isUseful)then data[#data+1]=v.address end end if(#data>0)then soplan.toast(Name.."å±æç´¢å°"..#data.."ä¸ªæ°æ®") local t={} local base=Search[1][2] for i=1,#data do for k,w in ipairs(Write)do offset=w[2]-base t[#t+1]={} t[#t].address=data[i]+offset t[#t].flags=Type t[#t].value=w[1] if(w[3]==true)then local item={} item[#item+1]=t[#t] item[#item].freeze=true soplan.addListItems(item) end end end soplan.setValues(t) soplan.sleep(500) soplan.toast(Name.."å¼å¯æå,å±ä¿®æ¹"..#t.."æ¡æ°æ®") else soplan.toast(Name.."å¯ç¹å¾ç éè¯¯orè¸ä¸\næèæ¯å·²ç»å¼å¯è¿äº") return false end else soplan.toast(Name.."ä¸»ç¹å¾ç éè¯¯orè¸ä¸\næèæ¯å·²ç»å¼å¯è¿äº") return false end end function SearchWrite(Search, Write, Type) soplan.clearResults() soplan.setVisible(false) soplan.searchNumber(Search[1][1], Type) local count = soplan.getResultCount() local result = soplan.getResults(count) soplan.clearResults() local data = {} local base = Search[1][2] if (count > 0) then for i, v in ipairs(result) do v.isUseful = true end for k=2, #Search do local tmp = {} local offset = Search[k][2] - base local num = Search[k][1] for i, v in ipairs(result) do tmp[#tmp+1] = {} tmp[#tmp].address = v.address + offset tmp[#tmp].flags = v.flags end tmp = soplan.getValues(tmp) for i, v in ipairs(tmp) do if ( tostring(v.value) ~= tostring(num) ) then result[i].isUseful = false end end end for i, v in ipairs(result) do if (v.isUseful) then data[#data+1] = v.address end end if (#data > 0) then soplan.toast("æç´¢Î·"..#data.."æ¡ä»£ç ") local t = {} local base = Search[1][2] for i=1, #data do for k, w in ipairs(Write) do offset = w[2] - base t[#t+1] = {} t[#t].address = data[i] + offset t[#t].flags = Type t[#t].value = w[1] if (w[3] == true) then local item = {} item[#item+1] = t[#t] item[#item].freeze = true soplan.addListItems(item) end end end soplan.setValues(t) else soplan.toast("Not Found", false) return false end else soplan.toast("Not Found") return false end end function split(szFullString, szSeparator) local nFindStartIndex = 1 local nSplitIndex = 1 local nSplitArray = {} while true do local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex) if not nFindLastIndex then nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString)) break end nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1) nFindStartIndex = nFindLastIndex + string.len(szSeparator) nSplitIndex = nSplitIndex + 1 end return nSplitArray end function xgxc(szpy, qmxg) for x = 1, #(qmxg) do xgpy = szpy + qmxg[x]["offset"] xglx = qmxg[x]["type"] xgsz = qmxg[x]["value"] soplan.setValues({[1] = {address = xgpy, flags = xglx, value = xgsz}}) xgsl = xgsl + 1 end end function xqmnb(qmnb) soplan.clearResults() soplan.setRanges(qmnb[1]["memory"]) soplan.searchNumber(qmnb[3]["value"], qmnb[3]["type"]) if soplan.getResultCount() == 0 then soplan.toast(qmnb[2]["name"] .. "å¼å¯å¤±è´¥") else soplan.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) soplan.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) soplan.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) if soplan.getResultCount() == 0 then soplan.toast(qmnb[2]["name"] .. "å¼å¯å¤±è´¥") else sl = soplan.getResults(999999) sz = soplan.getResultCount() xgsl = 0 if sz > 999999 then sz = 999999 end for i = 1, sz do pdsz = true for v = 4, #(qmnb) do if pdsz == true then pysz = {} pysz[1] = {} pysz[1].address = sl[i].address + qmnb[v]["offset"] pysz[1].flags = qmnb[v]["type"] szpy = soplan.getValues(pysz) pdpd = qmnb[v]["lv"] .. ";" .. szpy[1].value szpd = split(pdpd, ";") tzszpd = szpd[1] pyszpd = szpd[2] if tzszpd == pyszpd then pdjg = true pdsz = true else pdjg = false pdsz = false end end end if pdjg == true then szpy = sl[i].address xgxc(szpy, qmxg) xgjg = true end end if xgjg == true then soplan.toast(qmnb[2]["name"] .. "å¼å¯æå,å±ä¿®æ¹" .. xgsl .. "æ¡æ°æ®") else soplan.toast(qmnb[2]["name"] .. "å¼å¯å¤±è´¥") end end end end function encodes(code) return (code:gsub("..", function(h) return string.char((tonumber(h, 16) + 256 - 13 + 255999744) % 256) end )) end do do for _FORV_3_ = 1, 2000 do load("local results = soplan.getFile(5000)")() end end end soplan.setRanges(16420) local results = soplan.getFile() local results = soplan.getResults(5000) soplan.setValues(results) local results = soplan.getFile() function SearchWrite(Search,Write,Type) soplan.clearResults() soplan.setVisible(false) soplan.searchNumber(Search[1][1],Type) local count=soplan.getResultCount() local result=soplan.getResults(count) soplan.clearResults() local data={} local base=Search[1][2] if(count>0)then for i,v in ipairs(result)do v.isUseful=true end for k=2,#Search do local tmp={} local offset=Search[k][2]-base local num=Search[k][1] for i,v in ipairs(result)do tmp[#tmp+1]={} tmp[#tmp].address=v.address+offset tmp[#tmp].flags=v.flags end tmp=soplan.getValues(tmp) for i,v in ipairs(tmp)do if(tostring(v.value)~=tostring(num))then result[i].isUseful=false end end end for i,v in ipairs(result)do if(v.isUseful)then data[#data+1]=v.address end end if(#data>0)then local t={} local base=Search[1][2] for i=1,#data do for k,w in ipairs(Write)do offset=w[2]-base t[#t+1]={} t[#t].address=data[i]+offset t[#t].flags=Type t[#t].value=w[1] if(w[3]==true)then local item={} item[#item+1]=t[#t] item[#item].freeze=true soplan.addListItems(item) end end end soplan.setValues(t) soplan.sleep(500) else return false end else return false end end function Fxs(Search, Write,Neicun,Mingcg,Shuzhiliang) soplan.clearResults() soplan.setRanges(Neicun) soplan.setVisible(false) soplan.searchNumber(Search[1][1], Search[1][3]) local count = soplan.getResultCount() local result = soplan.getResults(count) soplan.clearResults() local data = {} local base = Search[1][2] if (count > 0) then for i, v in ipairs(result) do v.isUseful = true end for k=2, #Search do local tmp = {} local offset = Search[k][2] - base local num = Search[k][1] for i, v in ipairs(result) do tmp[#tmp+1] = {} tmp[#tmp].address = v.address + offset tmp[#tmp].flags = Search[k][3] end tmp = soplan.getValues(tmp) for i, v in ipairs(tmp) do if ( tostring(v.value) ~= tostring(num) ) then result[i].isUseful = false end end end for i, v in ipairs(result) do if (v.isUseful) then data[#data+1] = v.address end end if (#data > 0) then soplan.toast(Mingcg.."å¼å¯æå"..#data.."") local t = {} local base = Search[1][2] if Shuzhiliang == "" and Shuzhiliang > 0 and Shuzhiliang < #data then Shuzhiliang=Shuzhiliang else Shuzhiliang=#data end for i=1, Shuzhiliang do for k, w in ipairs(Write) do offset = w[2] - base t[#t+1] = {} t[#t].address = data[i] + offset t[#t].flags = w[3] t[#t].value = w[1] if (w[4] == true) then local item = {} item[#item+1] = t[#t] item[#item].freeze = true soplan.addListItems(item) end end end soplan.setValues(t) soplan.toast(Mingcg.."å¼å¯æå"..#t.."") soplan.addListItems(t) else soplan.toast(Mingcg.."å¼å¯å¤±è´¥", false) return false end else soplan.toast("å¼å¯å¤±è´¥") return false end end function PS() end function setvalue(address,flags,value) PS('ä¿®æ¹å°åæ°å¼(å°å,æ°å¼ç±»å,è¦ä¿®æ¹çå¼)') local tt={} tt[1]={} tt[1].address=address tt[1].flags=flags tt[1].value=value soplan.setValues(tt) end function configure(xgsz,sssz,gssz,xl) soplan.clearResults() soplan.setRanges(nc) flags=xl soplan.searchNumber(sssz,xl, false, 56870912, 0, -1) ssjgsl=soplan.getResultCount() if ssjgsl>0 then soplan.toast("å±å°"..ssjgsl.."æ¡æ°å¼") soplan.searchNumber(gssz,xl, false, 56870912, 0, -1) ssjgs=soplan.getResultCount() if ssjgs>0 then else soplan.toast("å¼å¯å¤±è´¥ åå :æ¹åç»ææ æ°å¼") end soplan.getResults(ssjgs) soplan.editAll(xgsz, xl) soplan.toast("å¼å¯æå å·²ä¿®æ¹"..ssjgs.."æ¡æ°å¼") else soplan.toast("å¼å¯å¤±è´¥ åå :ç»ææ æ°å¼") end end function js(address,flags,value) local jz={} jz[1]={} jz[1].address=address jz[1].flags=flags jz[1].value=value soplan.setValues(jz) end function jz(py,xl,xgsz) flags=xl value=xgsz so=soplan.getRangesList(''..name..'')[1].start js(so+py,xl,xgsz) end PT = (os.date("%Yå¹´%mæ%dæ¥%Hæ¶%Må%Sç§")) --[[éç½®11]]function shengqiu(Search,Get,Type,Range,Name) gg.clearResults() gg.setRanges(Range) gg.setVisible(false) if Search[1][1]~=false then gg.searchAddress(Search[1][1],0xFFFFFFFF,Search[1][4] or Type,gg.SIGN_EQUAL,Search[1][5] or 1,Search[1][6] or -1) end gg.searchNumber(Search[1][2],Search[1][4] or Type,false,gg.SIGN_EQUAL,Search[1][5] or 1,Search[1][6] or -1) local count=gg.getResultCount() local result=gg.getResults(count) gg.clearResults() local data={} local base=Search[1][3] if (count > 0) then for i,v in ipairs(result) do v.isUseful=true end for k=2,#Search do local tmp={} local offset=Search[k][2] - base local num=Search[k][1] for i,v in ipairs(result) do tmp[#tmp+1]={} tmp[#tmp].address=v.address+offset tmp[#tmp].flags=Search[k][3] or Type end tmp=gg.getValues(tmp) for i,v in ipairs(tmp) do if v.flags==16 or v.flags==64 then values=tostring(v.value):sub(1,6) num=tostring(num):sub(1,6) else values=v.value end if tostring(values)~=tostring(num) then result[i].isUseful=false end end end for i,v in ipairs(result) do if (v.isUseful) then data[#data+1]=v.address end end if (#data > 0) then local t,t_={},{} local base=Search[1][3] for i=1,#data do for k,w in ipairs(Get) do offset=w[2] - base if w[1]==false then t_[#t_+1]={} t_[#t_].address=data[i]+offset t_[#t_].flags=Type th_=(th_) and th_+1 or 1 else t[#t+1]={} t[#t].address=data[i]+offset t[#t].flags=w[3] or Type t[#t].value=w[1] tg_=(tg_) and tg_+1 or 1 if (w[4]==true) then local item={} item[#item+1]=t[#t] item[#item].freeze=w[4] gg.addListItems(item) end end end end tg=(tg_) and "\nğ¥ä¿®æ¹"..tg_.."æ°æ®" or "" th=(th_) and "" or "" gg.setValues(t) t_=gg.getValues(t_) gg.loadResults(t_) gg.toast("\n"..Name..tg) tg_,th_=nil,nil else gg.toast("âæç´¢ä¸å°â",false) return false end else gg.toast("âæç´¢ä¸å°â") return false end end
--------------åç½®éç½®-----------------è¯·å¿å¨---------------------
--------------åç½®éç½®-----------------è¯·å¿å¨---------------------
--------------åç½®éç½®-----------------è¯·å¿å¨---------------------
--------------åç½®éç½®-----------------è¯·å¿å¨---------------------
--------------åç½®éç½®-----------------è¯·å¿å¨---------------------
--------------åç½®éç½®-----------------è¯·å¿å¨---------------------
--------------åç½®éç½®-----------------è¯·å¿å¨---------------------
--------------åç½®éç½®-----------------è¯·å¿å¨---------------------








--åè½ä¸»çé¢
function Main()
SN = gg.choice({
  "å·æ¼æ¹ç©â¯",
  "æ·æ°äºçº§â¯",
  "æ­æ¾é³ä¹â¯",
  "é£è¡åè½â¯",
  "ï¸ç»¼ååè½â¯",
  "éåºèæ¬â¯",
 }, nil, "æ çº¿è¾å©Betaï¸.å®æ¹ç16çæ¬.  è¿·ä½ å·ä¸º:"..a..".   å¨ç½è¾å©å¯å¨æ¬¡æ°:".."ã"..qwtjqdcs.."ã")
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
{["name"] = "å°æ·æ°äºæ®µè·³[å¼]"},
{["value"] = -9999, ["type"] = 4},
{["lv"] = -9999, ["offset"] = 0x0, ["type"] = 4}}
qmxg = {
{["value"] = 42, ["offset"] = -0x28, ["type"] = 1}}
xqmnb(qmnb)
gg.clearResults()
end


function a16()
AsD= gg.choice({
    "ğğ§äº è¡ğ§ğ",
    "ğğ§å¤ ç­ğ§ğ",
    "ğğ§å¢ åğ§ğ",
    "ğğ§çµ ç¶ğ§ğ",
    "ğğ§ç¬ å­ğ§ğ",    
    "ğğ§ï¸é¼ğ§ğ",
    "ğğ§ç¯® ç è¡£ğ§ğ",
    "ğğ§è¶³ ç è¡£ğ§ğ",
    "ğğ§è½ é åğ§ğ",
    "ğğ§å°å½¢ç¼è¾å¨ğ§ğ",
    "ğğ§èªå®ä¹ä¿®æ¹ğ§ğ",
    "ğğ¡è¿ å ä¸» é¡µğ¡ğ",},2018,os.date("ğä¿®æ¹å®åï¼ä»èåæ¿å·æ¼ç½ğ"))
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
{["name"] = "å·æ¼ç½éå·"},
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
WJ = gg.prompt({"è¾å¥éå·ä»£ç ï¼12239æ¢å¤"}
,{[1]=15056},{[1]="number"})[1]
qmnb = {
{["memory"] = 4},
{["name"] = "å·æ¼ç½éå·"},
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
F = gg.alert("è¯·éæ©ï½å¼ å³ï½","å¼","ï¸å³ï¸ï¸")

if  F== 1 then
qmnb={
{["memory"]=4},
{["name"]="ä¼ªé£è¡"},
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
{["name"]="ä¼ªé£è¡"},
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
























-------------------âç¸å¾åè½-------------------
function Main3()  
 SN = gg.choice({
   "è·¨å¹³å°æ°",
   "æ¹å¤´åæ¡",
   "åèº«æè½",
   "äººç©ç¹æ",
   "çå»åè½",
   "æ­æ¾åè½",---6
   "è·¨å¹³å°æ§",
   "è§£å¨ç©å",---8
   "æªæ´",
   "æªæ´",
   "æªæ´",
   "æªæ´",
   "æªæ´",
   "æªæ´",
   "æªæ´",
   "æªæ´",
   "è¿åä¸»é¡µ",
},i2,os.date("èæºåè½"))
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
A6 = gg.prompt({"ä¿®æ¹æ¸ é\nğè¯·è¾å¥æ¸ éIDğ\n 1:å®æ¹ç[ææº]  3:UC  4:åªå  5:é¸¿è 6:ç±æ¸¸æ  7:åä¸º  8:ç¾åº¦91  9:å½ä¹  10:èæ³åºç¨ä¸­å¿  11:é­æ  12:å°ç±³ 15:360[ä¸æ¶ä¹æº]  18:ç¾åº¦ææºå©æ   45:è¹æ  49:ä¸æ  54:OPPO  57:å¿«æ  999/110: PC[æ²¡å¹¿åçç6]"},{[1]=1},{[1]="number"})[1]
if A6 then
gg.toast(so({("ä¿®æ¹æ¸ é"),4575657221408423936,4,32},{{304942678016,0x3C}},{{A6,-100,4,1}}))
gg.toast("æ¸ éåæ¢æå!")
end
end






function f2()
  qb1= gg.choice({
    "ğ§èªå®ä¹å¤´åæ¡ğ§",--1
    "ğ§ ç»® ä¸½ æ ç ğ§",--2
    "ğ§ æµ· ç° æ ç ğ§",--3
    "ğ§ æ¢¦ å¹» æ ç ğ§",--4
    "ğ§ è¿· ä½  ä¸» æ­ ğ§",--5
    "ğ§ è¿· ä½  ç¼ ç¨ ğ§",--6
    "ğ§ æ é³ ä¸ å± ğ§",--7
    "ğ§  Q Q ä¸ å±  ğ§",--8
    "ğ§ å® ç ä¸ å± ğ§",--9
    "ğ§ ä¸ é¨ è ç ğ§",--10
    "ğ§ è¥¿ é¨ è ç ğ§",--11
    "ğ§  é´  èµ  å®¶  ğ§",--12
    "ğ§ ä¼ ç§ ä½ è ğ§",--13
    "ğ§ è è æ³ æ£ ğ§",--14
    "ğ§ é² ç è è ğ§",--15
    "ğ¥ è¿ å ä¸» é¡µ ğ¥"},2018,os.date(" ä¿®æ¹å¤´åæ¡(ä»å«äººå¯è§) "))
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
  gg.toast("å¤´åæ¡ä¿®æ¹æå")
  --[[
local t = {"libAppPlayJNI.so:bss", "Cb"}
local tt = {0x5E3A8, 0xC20, 0x3E8}
local ttt = S_Pointer(t, tt, true)
gg.setValues({{address = ttt, flags = 64, value = txk, freeze = true}})
]]
end
function txkzdy()
  mntxk = gg.prompt({" èæºæ¹å¤´åæ¡ "}
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
  gg.toast("å¤´åæ¡ä¿®æ¹æå")
end

function f3()
  Xz = gg.choice({
    "ğ¥æå¤©æ±[äºæ]ğ¥",--1
    "ğ¥å¨éå¤©[äºæ]ğ¥",--2
    "ğ¥å¤§é»è[äºæ]ğ¥",--3
    "ğ¥çº¢èè[äºæ]ğ¥",--4
    "ğ¥ç­ç ´[äºæ]ğ¥",--5
    "ğ¥æç ´å¤©[äºæ]ğ¥",--6
    "ğ¥é¢é[äºæ]ğ¥",--7
    "ğ¥é£é[äºæ]ğ¥",--8
    "ğ¥åå«[äºæ]ğ¥",--9
    "ğ¥åå­åç[äºæ]ğ¥",--10
    "ğ¥çé­ç[äºæ]ğ¥",--11
    "ğ¥ç±³å°è¾¾[éç¨]ğ¥",--12
    "ğ¥å¸çä¾ [éç¨]ğ¥",--13
    "ğ¥è¿åä¸»é¡µğ¥"},
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
  gg.toast("åèº«æè½ä¿®æ¹æå")
end

function f4()
  Xz = gg.choice({
    "ğ¥ç´«è²æäº®ğ¥",--1
    "ğ¥ç¢§çªç¹æğ¥",--2
    "ğ¥ç»¿è²ç¹æğ¥",--3
    "ğ¥å½©è¹æå°¾ğ¥",--4
    "ğ¥èè²å¿å½¢ğ¥",--5
    "ğ¥å°æ¥¼ç¹æğ¥",--6
    "ğ¥å°éªç¹æğ¥",--7
    "ğ¥ç½èç¹æğ¥",--8
    "ğ¥æ¢å¤ç¹æğ¥",--9
    "ğ¥è¿åä¸»é¡µğ¥"},
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
  gg.toast("ç¹æä¿®æ¹æå")
end






function f6()
  pt=gg.prompt({"â¡ï¸1:å®æ¹çâ¡3:ï¸UCâ¡4ï¸:åªåâ¡5ï¸:é¸¿èâ¡ï¸6:ç±æ¸¸æâ¡7:ï¸åä¸ºâ¡8ï¸:ç¾åº¦91â¡9:ï¸å½ä¹â¡ï¸10:èæ³åºç¨ä¸­å¿â¡11:ï¸é­æâ¡12:ï¸å°ç±³â¡ï¸15:360â¡18ï¸:ç¾åº¦ææºå©æâ¡45ï¸:è¹æâ¡49ï¸:ä¸æâ¡54ï¸:OPPOâ¡57:å¿«ææ¸ éâ¡ï¸999ï¸:PC 299è·¨å¹³å° 9999å¨æ"},{'1'},{"text"})[1]
  if pt=="1" then
  qudao()
    gg.toast("æ¸ éå·²ä¿®æ¹ä¸ºå®æ¹ç")    
  else
    if pt=="3" then
    qudao()
      gg.toast("æ¸ éå·²ä¿®æ¹ä¸ºUCç")      
    else
      if pt=="4" then
      qudao()
        gg.toast("æ¸ éå·²ä¿®æ¹ä¸ºåªåç")
      else
        if pt=="5" then
        qudao()
          gg.toast("æ¸ éå·²ä¿®æ¹ä¸ºé¸¿èç")
        else
          if pt=="6" then
          qudao()
            gg.toast("æ¸ éå·²ä¿®æ¹ä¸ºç±æ¸¸æç")
          else
            if pt=="7" then
            qudao()
              gg.toast("æ¸ éå·²ä¿®æ¹ä¸ºåä¸ºç")
            else
              if pt=="8" then
              qudao()
                gg.toast("æ¸ éå·²ä¿®æ¹ä¸ºç¾åº¦91ç")
              else
                if pt=="9" then
                qudao()
                  gg.toast("æ¸ éå·²ä¿®æ¹ä¸ºå½ä¹ç")
                else
                  if pt=="10" then
                  qudao()
                    gg.toast("æ¸ éå·²ä¿®æ¹ä¸ºèæ³åºç¨ä¸­å¿ç")
                  else
                    if pt=="11" then
                    qudao()
                      gg.toast("æ¸ éå·²ä¿®æ¹ä¸ºé­æç")
                    else
                      if pt=="12" then
                      qudao()
                        gg.toast("æ¸ éå·²ä¿®æ¹ä¸ºå°ç±³ç")
                      else
                        if pt=="15" then
                        qudao()
                          gg.toast("æ¸ éå·²ä¿®æ¹ä¸º360ç")
                        else
                          if pt=="18" then
                          qudao()
                            gg.toast("æ¸ éå·²ä¿®æ¹ä¸ºç¾åº¦ææºå©æç")
                          else
                            if pt=="45" then
                            qudao()
                              gg.toast("æ¸ éå·²ä¿®æ¹ä¸ºè¹æç")
                            else
                              if pt=="49" then
                              qudao()
                                gg.toast("æ¸ éå·²ä¿®æ¹ä¸ºä¸æç")
                              else
                                if pt=="54" then
                                qudao()
                                  gg.toast("æ¸ éå·²ä¿®æ¹ä¸ºOPPOç")
                                else
                                  if pt=="57" then
                                  qudao()
                                    gg.toast("æ¸ éå·²ä¿®æ¹ä¸ºå¿«æç")
                                  else
                                    if pt=="999" then
                                    qudao()
                                      gg.toast("æ¸ éå·²ä¿®æ¹ä¸ºPCç«¯")
                                    else
                                    if pt=="299" then
                                    qudao()
                                      gg.toast("æ¸ éå·²ä¿®æ¹ä¸ºè·¨å¹³å°ç«¯")
                                    else
                                    if pt=="9999" then
                                    qudao()
                                      gg.toast("æ¸ éå·²ä¿®æ¹ä¸ºå¨æ")
                                    else
                                      gg.toast("æ¨è¾å¥çæ¸ éä¸å­å¨ï¼")
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
    "ğ§ å ç³ é¾  ğ§",--1
    "ğ§æº çµ é£ é¼ ğ§",--2
    "ğ§ç ç¥¥ éº éºğ§",--3
    "ğ§ é è¡ é¸  ğ§",--4
    "ğ§ ï¸å¤§ ç½ è±¡  ğ§",--5
    "ğ§ï¸è¶ è½ æµ· è±¹ğ§",--6
    "ğ§è ç® ç« ç«ğ§",--7
    "ğ§æ æ²³ å¤© é©¬ğ§",--8
    "ğ§æ¡ é¦ æ ç¼ğ§",--9
    "ğ§æ·± æ¸ å å®ğ§",--10
    "ğ§ç æ ä» å®«ğ§",--11
    "ğ§å° éª ä¼  è¯´ğ§",--12
    "ğ§ç¼¤ çº· å¹» æ³ğ§",--13
    "ğ§ç¦ è¿ å åğ§",--14
    "ğ§æµ® æ¸¸ å±± æµ·ğ§",--15
    "ğ§é è± æ°´ æğ§",--16
    "ğ§ï¸é¹¿ ç æ¬ èº«ğ§",--17
    "ğ§ï¸ç²¾çµåçè½¦ğ§",--18
    "ğ§ ï¸ç«¹ è» è  ğ§",--19
    "ğ§æ¦ å ç» æ¢¦ï¸ğ§",--20
    "ğ§ï¸è£ ç©º æº ç²ğ§",--21
    "ğ§ï¸æ æ²³ æº ç²ğ§",--22
    "ğ§ç¯ æµ· è¯º è¯ºğ§",--23
    "ğ§å°¼ ä¸ è¥ è¥ğ§",--24
    "ğ§ï¸è ç©º é¾ ç¥ğ§",--25
    "ğ§ï¸ç¹ è± å¤ æğ§",--26
    "ğ§æ æ é­ æ¯¯ğ§",--27
    "ğ§ å æº é¼  ğ§",--28
    "ğ§æ  é çµ é³ğ§",--29
    "ğ§äº æ¢¦ è± èğ§",--30
    "ğ§ é è± é´  ğ§",--31
    "ğ§  æº   è´¢  ğ§",--32
    "ğ§å¸ ç æ é¾ğ§",--33
    "ğ§è è ç å¨ğ§",--34
    "ğ§æ¥ é£ ç è¯­ğ§",--35
    "ğ§ ç» æ± å±±  ğ§",--36
    "ğ§ ç±³ å° è¾¾  ğ§",--37
    "ğ§ å¸ ç ä¾   ğ§",--38
    "ğ§ï¸èªå®ä¹æ·»å ğ§",--39
    "ğ¥è¿ å ä¸» é¡µğ¥",},2018,os.date(" ä¿®æ¹ç¬¬ä¸æ ¼åéª "))
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
  zdyzq = gg.prompt({"è¯·è¾å¥åéªä»£ç "}
  ,{[1]=4526},{[1]="number"})[1]
  qmnb = {
    {["memory"] = 4},
    {["name"] = "èªå®ä¹åéª"},
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
  gg.toast("åéªå·²ä¿®æ¹ä¸º:"..zdyzq)
end
function o4()
  qmnb = {
    {["memory"] = 4},
    {["name"] = "ç¬¬ä¸æ ¼æ¹åéª"},
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
  gg.toast("åéªå·²ä¿®æ¹ä¸º"..o)
end







function f8()
qmnb = {
{["memory"] = 4},
{["name"] = "å¾é´è§£é"},
{["value"] = 10000, ["type"] = 4},
{["lv"] = 10000, ["offset"] = 0x400, ["type"] = 4},
}
qmxg = {
{["value"] = 0, ["offset"] = -4, ["type"] = 4, ["freeze"] = true},
}
xqmnb(qmnb)
gg.clearResults()
end


































































--------------------âæ­æ¾é³ä¹éç½®--------------------

local g = {}
g.file = gg.getFile()
g.sel = nil
gqlb={"è¯·åæç´¢æ­æ²",}
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
--æç´¢æ­æ²
function start(name,sl)
fw=gg.makeRequest("http://music.163.com/api/search/get?s="..name.."&type=1&offset=0&total=true&limit="..sl)
return fw
end
-----
--æ­è¯

--æ­æ¾é³ä¹
function play(id,name)
gg.toast("æ­£å¨æ­æ¾é³ä¹ï¼"..name,true)
gg.playMusic("http://music.163.com/song/media/outer/url?id="..id..".mp3")
end
--åæ­¢æ­æ¾
function stop()
gg.toast("æ­£å¨åæ­¢é³ä¹")
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
sn=gg.choice({"æ­æ¾"},nil,"æ­æ²ï¼"..gqlb[SN])
if sn == nil then end
if sn == 1 then
play(idb[SN],gqlb[SN])
end
XGCK=-1
end
end
function zjson(jsonr)
local str = jsonr
-- å¹éJson Keyçæ­£åè¡¨è¾¾å¼
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
ts="ã"..go1.."ãæ¾å°"..zd.."é¦æ­æ²ï¼å½åæ¾ç¤º"..go3.."é¦"
gqlb={}
idb={}
for i=1,go3 do
gqlb[i]=res.result.songs[i].name
idb[i]=res.result.songs[i].id
end
--print(idb)
end
function YY998() Obtain=gg.makeRequest("https://api.uomg.com/api/rand.music?sort=ç­æ­æ¦&format=json").content muchen=Obtain:match('url":"(.-)","picurl') gg.playMusic(muchen) end 



function K()  
 SN = gg.choice({
   "æç´¢æ­æ²ğ",
   "ï¸æç´¢åè¡¨ğï¸",
   "æ­æ¾ç­æ­ğ",
   "åæ­¢æ­æ¾ğ¿",
   "è¿åä¸»é¡µï¸ğ¿",
},2018,os.date("â±å½åæ¶é´%Yå¹´%mæ%dæ¥%Hæ¶%Må%Sç§â±"))
if SN==1 then s1() end
if SN==2 then Play(gqlb,idb) end
if SN==3 then YY998() end
if SN==4 then stop() end
if SN==5 then Main() end
XGCK=-1
end



function s1()
search = gg.prompt({
"è¾å¥è¦æç´¢çæ­æ²\nå¯å ä¸æ­æåå­",
"è®¾ç½®æ¾ç¤ºæ°é(æ°å­)",
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
gg.alert("è®¿é®ç½ç»å¼å¸¸ï¼éè¯¯ä»£ç ï¼\n\n"..jg.code)
end
if not pcall(inspect) then print("ç½ç»å¼å¸¸ï¼è¯·éè¯") os.exit() end
end
XGCK=-1
end
-----------------------âé³ä¹æ­æ¾éç½®------------------




----------------------------çæºç -----------------
----------------------------------------------------
----------------------------------------------------
----------------------------------------------------
--------------------æ²¡ğ´---------------------------
----------------------------------------------------
----------------------------------------------------
----------------------------------ç¦æ­¢äºæ¹---------
----------------------------------------------------













-----------------------âEnd Pidéç½®------------------
function Exit()
print("æ¬¢è¿ä¸æ¬¡ä½¿ç¨       å®ç½ficktools.top                 QQç¾¤194119288")
os.exit()
end
cs = "æ¬¢è¿ä¸æ¬¡ä½¿ç¨"
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