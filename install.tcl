#### VMD Store Installer
#### Installation via VMD Tk Console

#### Requirements
## VMD 1.9.3 later

#### How to install ?
## 1. Launch VMD;
## 2. Open the Tk Console (Extensions > Tk console);
## 3. Please enter the path to packmol1.0 place, such as /home/users/script/packmol1.0

############################################################################################################
############################################################################################################
############################################################################################################
############################################################################################################

#### Installation code
set packmolguiVersion "packmol1.0" ; #Current PACKMOL-GUI version
puts "Please enter the path to packmol1.0 place, such as /home/users/script/packmol1.0:"
gets stdin installPath ; #Ask for user input - Installation Path
puts "The packmolgui ($packmolguiVersion) is going to be installed in $installPath"
set vmdrcPath  ""
# Add the installation line to .vmdrc or vmd.rc file
if {[string first "Windows" $::tcl_platform(os)] != -1} {
   set home [file dirname [info nameofexecutable]]
   set vmdrcPath "$home/vmd.rc"
} else {
   set current_user [exec whoami]
   if { $current_user eq "root" } {
        while {1} {
        puts "You are logged in as root. Please provide the path to the vmdrc file (e.g., /usr/local/lib/vmd):"
        set home [gets stdin]
        set vmdrcPath "$home/.vmdrc"
        if {[file exists $vmdrcPath] && [file writable $vmdrcPath]} {
            return $vmdrcPath
         } else {
           puts "Error: The provided path is invalid or not writable. Please try again."
         }
        }

     } else {
        set home $::env(HOME)
        set vmdrcPath "$home/.vmdrc"
     }
}
set file [open "$vmdrcPath" a+]
puts $file "##### packmolgui ## START #####\""
puts $file "menu main      on"
puts $file "lappend auto_path \"$installPath\""
puts $file "vmd_install_extension packmol packmol_tk \"Modeling/Packmol-GUI\""
puts $file "## Please, do not change this file unless you know what are you doing! ##"
close $file

# Final messages
puts "Installation Complete!"
puts "==============================================================="
puts "Enjoy the packmolgui under the \n\"Extensions\" > \"Modeling\" > \"Packmol-Gui\"\n menu of VMD."
puts "==============================================================="
puts "\n\nPlease, re-launch the VMD!"
