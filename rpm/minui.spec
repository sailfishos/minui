Name:       minui-devel
Summary:    Library for minimal UI framebuffer applications.
Version:    0.0.1
Release:    1
Group:      System/Applications
License:    ASL 2.0
URL:        https://github.com/sailfishos/minui.git
Source0:    %{name}-%{version}.tar.bz2
BuildRequires:  libpng-devel

%description
%{summary}.

%prep
%setup -q -n %{name}-%{version}

%build
make %{?_smp_mflags}

%install
rm -rf %{buildroot}
make install DESTDIR=%{?buildroot}

%files
%defattr(-,root,root,-)
%dir %{_includedir}/minui
%{_includedir}/minui/minui.h
%{_libdir}/libminui.a
%{_libdir}/pkgconfig/minui.pc
