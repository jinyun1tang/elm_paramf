begin

;---Set some NetCDF options before we open the file
  setfileoption("nc","preFill",False)
  setfileoption("nc","defineMode",True)

  fout_name="froot_long.nc"
  system("rm -f " + fout_name)
  fout=addfile(fout_name, "c")

  pfts          = ispan(1,25,1)
  pfts!0        ="pft"

  dims=dimsizes(pfts)
  dim_names=(/pfts!0/)
  dim_unlimited=(/True/)
  filedimdef(fout,dim_names,dims,dim_unlimited)

  filevardef(fout,"froot_long","double",(/pfts!0/))
   fatt=True
   fatt@long_name="fine root longivity"
   fatt@units = "yr"
   filevarattdef(fout,"froot_long", fatt)


 fout->froot_long = (/0.0, 0.5, 0.5, 0.5, 0.5, \
    0.5, 0.5, 0.5, 0.5, 0.5, \
    0.5, 0.5, 0.5, 0.5, 0.5, \
    0.5, 0.5, 0.5, 0.5, 0.5, \
    0.5, 0.5, 0.5, 0.5, 0.5/)

   delete(fout)

end
