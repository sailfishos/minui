Name:       minui-devel
Summary:    Library for minimal UI framebuffer applications
Version:    0.0.8
Release:    1
License:    ASL 2.0
URL:        https://github.com/sailfishos/minui.git
Source0:    %{name}-%{version}.tar.bz2
BuildRequires:  libpng-devel
BuildRequires:  libdrm-devel

%description
%{summary}.

%prep
%setup -q -n %{name}-%{version}

%build
%make_build LIB=%{_lib}

%install
%make_install LIB=%{_lib}

%files
%dir %{_includedir}/minui
%license LICENSE
%{_includedir}/minui/minui.h
%{_libdir}/libminui.a
%{_libdir}/pkgconfig/minui.pc
